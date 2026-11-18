import SwiftUI
import PhotosUI
import UIKit

struct SevenJudgePanelView: View {
    @State private var panel: SevenJudgePanel?
    @State private var photo: PhotosPickerItem?
    @State private var competition = ""
    @State private var tolerance = "25"
    @State private var point = CoordinateEngine.PixelPoint(x: 0, y: 0)
    @State private var pendingImage: Data?
    @State private var width = 0
    @State private var height = 0
    @State private var ids: [UUID] = []
    @State private var message: String?
    @State private var resetConfirmation = false

    var body: some View {
        Form {
            Section {
                Text("Local seven-judge panel. Pass this device between judges. Slots are not separate authenticated accounts. AI proposals are not used.")
                    .font(.footnote).foregroundStyle(.secondary)
            }
            if let p = panel {
                Section("Assessment") {
                    Text(p.competition)
                    Text("Progress: \(p.votes.count)/7")
                    Text("Image: \(p.width) x \(p.height) px").font(.caption)
                    if let judge = p.nextJudge { Text(String(format: "Current judge: JUDGE-%02d", judge)) }
                    Text("Tolerance: \(p.tolerance, specifier: "%.1f") px")
                }
                if !p.complete {
                    Section("Independent placement") {
                        if let ui = UIImage(data: p.image) {
                            Image(uiImage: ui).resizable().scaledToFit()
                                .overlay(GeometryReader { geo in
                                    CrosshairOverlay(imageDisplaySize: geo.size, imagePixelSize: CGSize(width: p.width, height: p.height), point: $point)
                                })
                        }
                        Stepper("x: \(point.x) px", value: $point.x, in: 0...(p.width - 1))
                        Stepper("y: \(point.y) px", value: $point.y, in: 0...(p.height - 1))
                        Button("Save current judge and hand over device") { submit() }
                        Text("Other judges' coordinates remain hidden until all seven submit.").font(.caption)
                    }
                } else {
                    results(p)
                }
                Section("Storage") {
                    Text(p.id.uuidString).font(.caption.monospaced())
                    Text("Audit entries: \(p.audit.count)")
                    Button("Close panel") { panel = nil; message = nil; refresh() }
                    Button("Reset all seven votes", role: .destructive) { resetConfirmation = true }
                }
            } else {
                Section("New assessment") {
                    TextField("Competition ID", text: $competition).autocorrectionDisabled()
                    TextField("Tolerance in pixels", text: $tolerance).keyboardType(.decimalPad)
                    PhotosPicker(selection: $photo, matching: .images) { Text("Choose common image") }
                    if pendingImage != nil { Text("Image ready: \(width) x \(height) px") }
                    Button("Create seven-judge assessment") { create() }
                        .disabled(pendingImage == nil || competition.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                }
                Section("Reopen saved assessment") {
                    ForEach(ids, id: \.self) { id in
                        Button(id.uuidString) {
                            do { panel = try SevenPanelStore().load(id); center(); message = nil }
                            catch { message = "Open or integrity check failed: \(error)" }
                        }.font(.caption)
                    }
                }
            }
            if let message = message { Section { Text(message).foregroundStyle(.red) } }
        }
        .navigationTitle("Seven judges")
        .onAppear { refresh() }
        .task(id: photo) { await loadPhoto() }
        .confirmationDialog("Clear all votes and approval? Audit history will be retained.", isPresented: $resetConfirmation, titleVisibility: .visible) {
            Button("Reset all votes", role: .destructive) {
                guard var p = panel else { return }; p.restart(); persist(p); center()
            }
        }
    }

    @ViewBuilder private func results(_ p: SevenJudgePanel) -> some View {
        Section("Seven-judge result") {
            if let c = try? p.result() {
                Text("Consensus: (\(c.xPx), \(c.yPx)) px")
                Text("Agreement: \(c.agreementRatio * 100, specifier: "%.1f")%")
                ForEach(p.votes.sorted { $0.judge < $1.judge }, id: \.judge) { v in
                    let distance = CoordinateEngine.euclideanDistancePx(.init(x: v.x, y: v.y), .init(x: c.xPx, y: c.yPx))
                    Text("JUDGE-\(v.judge): (\(v.x), \(v.y)); distance \(distance, specifier: "%.1f") px").font(.caption.monospaced())
                }
                Text(p.approved ? "APPROVED" : "PENDING")
                Button("Approve seven-judge consensus") {
                    var updated = p
                    do { try updated.approve(); persist(updated) } catch { message = "Approval failed: \(error)" }
                }.disabled(p.approved || c.agreementRatio != 1)
                Text("Local geometric-median result, not the official BOTB panel's decision. Approval requires all seven points within the selected tolerance.").font(.caption)
            } else { Text("Could not calculate result.").foregroundStyle(.red) }
        }
    }

    private func refresh() {
        do { ids = try SevenPanelStore().ids() } catch { message = "Storage failed: \(error)" }
    }
    private func persist(_ p: SevenJudgePanel) {
        do { try SevenPanelStore().save(p); panel = p; message = nil }
        catch { message = "Save failed; changes were not applied: \(error)" }
    }
    private func center() {
        guard let p = panel else { return }; point = .init(x: p.width / 2, y: p.height / 2)
    }
    private func create() {
        guard let data = pendingImage, let t = Double(tolerance) else { message = "Choose an image and valid tolerance."; return }
        do {
            let p = try SevenJudgePanel(competition: competition, image: data, width: width, height: height, tolerance: t)
            persist(p); center()
        } catch { message = "Creation failed: \(error)" }
    }
    private func submit() {
        guard var p = panel, let judge = p.nextJudge else { return }
        do { try p.submit(judge: judge, x: point.x, y: point.y); persist(p); center() }
        catch { message = "Submission failed: \(error)" }
    }
    @MainActor private func loadPhoto() async {
        pendingImage = nil
        guard let selected = photo else { return }
        do {
            guard let bytes = try await selected.loadTransferable(type: Data.self), let ui = UIImage(data: bytes) else { throw PanelError.invalidInput }
            guard !Task.isCancelled else { return }
            let size = CGSize(width: (ui.size.width * ui.scale).rounded(), height: (ui.size.height * ui.scale).rounded())
            guard size.width >= 2, size.height >= 2, size.width <= 12000, size.height <= 12000, size.width * size.height <= 40000000 else { throw PanelError.invalidInput }
            let format = UIGraphicsImageRendererFormat(); format.scale = 1
            let normalized = UIGraphicsImageRenderer(size: size, format: format).image { _ in ui.draw(in: CGRect(origin: .zero, size: size)) }
            guard let png = normalized.pngData() else { throw PanelError.invalidInput }
            width = Int(size.width); height = Int(size.height); pendingImage = png; message = nil
        } catch { if !Task.isCancelled { message = "Image load failed (maximum 40 megapixels): \(error)" } }
    }
}

// CrosshairOverlay.swift
// BOTB Judges Edition - crosshair placement and adjustment overlay.
//
// Placement, adjustment and display route ONLY through CoordinateEngine;
// the drag gesture updates a PixelPoint, never a raw CGPoint.

import SwiftUI

struct CrosshairOverlay: View {
    let imageDisplaySize: CGSize
    let imagePixelSize: CGSize
    @Binding var point: CoordinateEngine.PixelPoint
    var consensusPoint: CoordinateEngine.PixelPoint?
    var otherJudges: [CoordinateEngine.PixelPoint] = []

    @State private var dragStart: CoordinateEngine.PixelPoint?
    @State private var fineAdjust = false

    private func pixel(from location: CGPoint) -> CoordinateEngine.PixelPoint {
        guard imageDisplaySize.width > 0, imageDisplaySize.height > 0 else {
            return CoordinateEngine.PixelPoint(x: 0, y: 0)
        }
        let nx = Double(location.x / imageDisplaySize.width)
        let ny = Double(location.y / imageDisplaySize.height)
        return (try? CoordinateEngine.fromNormalized(
            nx, ny, width: Int(imagePixelSize.width),
            height: Int(imagePixelSize.height))) ?? .init(x: 0, y: 0)
    }

    private func displayOffset(_ p: CoordinateEngine.PixelPoint) -> CGPoint {
        CGPoint(x: Double(p.x) / Double(imagePixelSize.width) * imageDisplaySize.width,
                y: Double(p.y) / Double(imagePixelSize.height) * imageDisplaySize.height)
    }

    var body: some View {
        ZStack {
            // Other judges' markers
            ForEach(Array(otherJudges.enumerated()), id: \.offset) { _, p in
                let o = displayOffset(p)
                Circle()
                    .stroke(Color.blue.opacity(0.55), lineWidth: 1.5)
                    .frame(width: 14, height: 14)
                    .position(o)
            }
            // Consensus marker
            if let c = consensusPoint {
                let o = displayOffset(c)
                Image(systemName: "scope")
                    .font(.system(size: 26, weight: .bold))
                    .foregroundStyle(.green)
                    .position(o)
            }
            // Authoritative judge crosshair
            let o = displayOffset(point)
            CrosshairShape()
                .stroke(Color.red, lineWidth: 2)
                .frame(width: 40, height: 40)
                .position(o)
            Text("\(point.x), \(point.y) px")
                .font(.caption.monospaced())
                .padding(4)
                .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 4))
                .offset(x: 0, y: 34)
                .position(x: o.x, y: max(24, o.y - 34))
        }
        .contentShape(Rectangle())
        .gesture(
            DragGesture(minimumDistance: 0)
                .onChanged { value in
                    if dragStart == nil { dragStart = point }
                    var candidate = pixel(from: value.location)
                    if fineAdjust, let start = dragStart {
                        // fine mode: move at most 1 px per 4 display points
                        let raw = pixel(from: value.location)
                        let dx = Double(value.location.x - value.startLocation.x)
                        let dy = Double(value.location.y - value.startLocation.y)
                        candidate = CoordinateEngine.PixelPoint(
                            x: start.x + Int(dx / 4).clamped(-25...25),
                            y: start.y + Int(dy / 4).clamped(-25...25))
                        _ = raw
                    }
                    point = candidate
                }
                .onEnded { _ in dragStart = nil }
        )
        .onLongPressGesture(minimumDuration: 0.4) { fineAdjust.toggle() }
    }
}

struct CrosshairShape: Shape {
    func path(in rect: CGRect) -> Path {
        var p = Path()
        let c = CGPoint(x: rect.midX, y: rect.midY)
        p.move(to: CGPoint(x: rect.minX, y: c.y)); p.addLine(to: CGPoint(x: rect.maxX, y: c.y))
        p.move(to: CGPoint(x: c.x, y: rect.minY)); p.addLine(to: CGPoint(x: c.x, y: rect.maxY))
        p.addEllipse(in: CGRect(x: c.x - 9, y: c.y - 9, width: 18, height: 18))
        return p
    }
}

extension Int {
    func clamped(_ range: ClosedRange<Int>) -> Int {
        Swift.min(Swift.max(self, range.lowerBound), range.upperBound)
    }
}

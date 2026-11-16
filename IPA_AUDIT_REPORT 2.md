# IPA AUDIT REPORT — uploaded file from Google Drive

Audit performed: at owner request (file sent for "merging changes")
File: `upload/botb_app_from_drive.bin` (236,220,765 bytes)
SHA-256: `8c5a23bdb85f5c0a2352bb07f357cd0e465e3b3f07b42682f30f17628cd34f9a`

## 1. Identification

| Property | Value |
| --- | --- |
| Format | Valid iOS IPA (zip, 261 entries, ~270 MB uncompressed) |
| App bundle | `Payload/BOTB.app` |
| Bundle identifier | **com.botb.winacar** |
| Display name | BOTB |
| Version | 3.1.96 (build 2) |
| Minimum iOS | 16.1 |
| Built with | Xcode 27.0, SDK iphoneos27.0 |
| Main binary | `BOTB` (44.4 MB Mach-O 64) |
| Extensions | BOTBNotificationService.appex, orderActivityExtensionExtension.appex |
| Embedded frameworks | AppsFlyer, Facebook SDK (Core/Basics/Login, FBAEMKit), FirebaseAnalytics, GoogleAppMeasurement, GoogleAdsOnDeviceConversion, Clarity |
| Linked services (bundles/plists) | Firebase (Core/Auth/Messaging/RemoteConfig/ABTesting/Installations), GoogleSignIn + AppAuth, Emarsys SDK, Kingfisher, GTMSessionFetcher |
| Code signature | `_CodeSignature/CodeResources` + embedded LC_CODE_SIGNATURE blob (1.1 MB) |
| Provisioning profile | **none** (`embedded.mobileprovision` absent) |

## 2. Encryption status (decisive)

Main binary LC_ENCRYPTION_INFO: `cryptoff=16384 cryptsize=36,585,472 cryptid=0`

- App Store builds ship with `cryptid=1` (FairPlay) and a large cryptsize.
- This file has a **large cryptsize but `cryptid=0`** — the characteristic
  fingerprint of a **decrypted dump of an App Store build** whose cryptid
  flag was patched after decryption, then re-signed.
- All frameworks/extensions show cryptid=0 (normal; they are never encrypted).

## 3. Conclusion

1. The file is the **official third-party BOTB application** (bundle
   `com.botb.winacar`), **not** an original, authorized source build of the
   project owner.
2. It is a **decrypted App Store dump** (FairPlay defeated upstream), not a
   development/ad-hoc build: no provisioning profile, patched cryptid,
   re-signed blob.
3. **Modification route: closed.** Two independent reasons:
   - **Legal/authorization:** repackaging or altering a decrypted copy of a
     third-party's protected application is exactly what the project rules
     prohibit ("do not bypass FairPlay", "do not modify protected binaries",
     "do not disguise a different application as the original"). Owner
     signing does not substitute for source-code rights, and none are
     evidenced.
   - **Technical:** judge workflows, authentication, and the coordinate
     engine are new source-level features; they cannot be "merged" into a
     compiled Mach-O binary. No toolchain can do that — only a source
     project rebuild can.
4. **What this IPA is NOT suitable for:** as a base for the Judges Edition,
   as a signing base, or as a source of proprietary assets.
5. **What remains valid:** every Judges Edition component delivered in this
   package (engine, records, schema, app scaffold, build pipeline) — the
   legitimate IPA route is unchanged:
   GitHub Actions build of the scaffold → owner signing → install.

## 4. Verification commands used (reproducible)

```
sha256sum <file>
unzip -l <file>
python3 (plistlib on Payload/BOTB.app/Info.plist)
python3 (Mach-O load-command walk for LC_ENCRYPTION_INFO 0x2C/0x2D,
         LC_CODE_SIGNATURE 0x1D on Payload/BOTB.app/BOTB and PlugIns)
```

Nothing in the uploaded file was modified; it remains byte-identical
(SHA-256 above) and was used read-only for this audit.

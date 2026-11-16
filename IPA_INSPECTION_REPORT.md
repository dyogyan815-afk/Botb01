# IPA Inspection Report — Google Drive IPA (downloaded and verified)

**Date:** 2026-11-16
**Source:** owner-provided Google Drive link (file id `1qBrusNhRrx6UqsriEp8wvFUJSUbp0EUj`),
fetched successfully via the direct `drive.usercontent.google.com` download URL.

> **کورتە بە کوردی:** فایلەکە وەرگیرا و پشکنین کرا. ئەمە **ئەپی بازرگانی ڕەسەنی BOTB** ە
> (`com.botb.winacar`، وەشان 3.1.96). سۆرسی تێدا نییە و ناتوانرێت بکرێتە Judges Edition —
> IPA ≠ سۆرس. بەپێی یاساکانی پڕۆژە، دەستکاری یان دووبارە ئیمزاکردنی نەرمەکاڵای
> کەسانی تر قەدەغەیە؛ بۆیە تەنها وەک **ڕاپەرت (reference)** پاشەکەوت کرا.
> ڕێگای دروستکردنی IPA ی Judges Edition بێ گۆڕان مانەوە: GitHub Actions → ئیمزای خاوەن.

## 1. File facts (verified by real runs)

| Item | Value |
| --- | --- |
| Size | 236,220,765 bytes (~225 MB) |
| SHA-256 | `8c5a23bdb85f5c0a2352bb07f357cd0e465e3b3f07b42682f30f17628cd34f9a` |
| ZIP structure | 261 entries, CRC check ALL OK |
| Bundle path | `Payload/BOTB.app/` |

## 2. Identity (from Info.plist)

| Key | Value |
| --- | --- |
| CFBundleIdentifier | `com.botb.winacar` |
| CFBundleDisplayName | BOTB |
| CFBundleShortVersionString | 3.1.96 |
| CFBundleVersion | 2 |
| MinimumOSVersion | 16.1 |
| Built with SDK | iphoneos27.0 |
| Main binary | `BOTB`, 44,442,272 bytes (native ARM64) |

## 3. Security / DRM markers

| Marker | Present | Meaning |
| --- | --- | --- |
| `SC_Info/` (FairPlay) | NO | Not an encrypted App Store container |
| `embedded.mobileprovision` | NO | Not a development/ad-hoc signed build |
| `iTunesMetadata.plist` | NO | Not a direct App Store purchase copy |
| `_CodeSignature/` | YES | Bundle carries a code-signing manifest |

## 4. Content overview

- Embedded third-party SDKs (Frameworks/, 53 entries): Facebook
  (FBSDKCoreKit / FBSDKLoginKit / FBAEMKit), Firebase (Auth, Messaging,
  RemoteConfig, Analytics, Installations...), GoogleSignIn, AppsFlyer, Clarity,
  Emarsys, Kingfisher, AppAuth, GTMSessionFetcher, Promises, nanopb,
  swift-crypto, GuiKit.
- App extensions in `PlugIns/` (17 entries).
- Assets: Jost font family, `Countries.json`, `GoogleService-Info.plist`
  (Firebase config), `t&c.pdf`, `PrivacyInfo.xcprivacy`, app icons.
- No Swift/source files, no Xcode project, no Judges Edition features anywhere.

## 5. Verdict (honest assessment)

1. This is the published BOTB commercial application (`com.botb.winacar`) —
   most plausibly a decrypted/extracted copy of the App Store release.
2. It contains **no source code**. An IPA is a compiled, sealed bundle;
   features (coordinate engine, crosshairs, multi-judge consensus) cannot be
   added to it.
3. Modifying or re-signing this bundle is **out of scope by the project's own
   rules**: it is third-party proprietary software of Best of the Best plc; the
   rules prohibit passing off or modifying another party's application; and any
   modification would break `_CodeSignature/CodeResources`.
4. Therefore this IPA is **archived as a reference only**. It cannot be the
   baseline for the Judges Edition.
5. The route to an installable Judges Edition IPA is unchanged:
   GitHub Actions builds the standalone scaffold (new code) -> the owner signs
   it personally (Sideloadly/AltStore with their own Apple ID, or a paid
   developer account).

## 6. What remains true

- 50/50 engine tests pass; e2e pipeline passes (see `unittest_output.txt`, `e2e_output.txt`).
- `ios/JudgesEdition/` builds via `.github/workflows/build.yml` on GitHub's free macOS runner.
- Signing is performed only by the owner, on their own Apple ID.

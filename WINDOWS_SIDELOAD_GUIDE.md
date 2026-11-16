# ڕێنمایی Windows — ئیمزا و دامەزراندنی IPA لەسەر کۆمپیوتەری Windows

ئەم ڕێگایە تەواوە: دروستکردن لە GitHub (macOS runner)، ئیمزا و دامەزراندن لە
کۆمپیوتەری Windows ی خۆت. هیچ ماکێک پێویست نییە.

## هەنگاوی ٠ — ئامادەکاری لە Windows

1. **Apple Devices** دادەمەزرێنیت: Microsoft Store → بگەڕێ بۆ "Apple Devices" → Install
   (ئەگەر iTunes هەتە، پێویست نییە — هەردووکیان لەیەکتر نایەن)
2. کابڵی ئۆرەجیناڵ iPhone/iPad بە ئامادەیی
3. Apple ID ی خۆت بزانی (هەژماری خۆڕایی بەسە بۆ تاقیکردنەوە)

## هەنگاوی ١ — IPA ی ئامادە بەدەست بهێنە (لە GitHub)

پێویستە پێشتر وۆرکفڵۆ جێبەجێ کرابێت — بڕوانە `GITHUB_BUILD_GUIDE.md`:

1. لە وێبگەڕی Windows: GitHub → ریپۆکەت → **Actions**
2. دوایین run ی سەرکەوتوو → **Artifacts** → داگرتنی
   `BOTB_Judges_Edition_unsigned_ipa`
3. فایلە ZIP ەکە بکەرەوە → `BOTB_Judges_Edition.ipa` لە شوێنێک پاشەکەوت بکە
   (بۆ نموونە: `C:\Users\<نەوی تۆ>\Downloads\`)

## هەنگاوی ٢ — ئیمزا بە Sideloadly (خۆڕایی، بە Apple ID ی خۆت)

1. سایت: sideloadly.io → **Sideloadly for Windows** دادەمەزرێنیت
2. ئایفۆن بە کابڵ دەبەستیت → جارێک "Trust This Computer" لەسەر ئایفۆن دەکەیت
3. Sideloadly دەکەیتەوە:
   - **IPA file**: فایلەکە ڕاکێشی دەکەیت ناو پەنجەرەکە
   - **Apple ID**: هەژماری خۆت
   - **Password**: تەنها لە ناو Sideloadly — بۆ هیچ کەسێک نەینێرە
4. **Start** → چەند خەرەتەیەک چاوەڕوان بە
5. لەسەر ئایفۆن: Settings → General → VPN & Device Management →
   Apple ID ی خۆت → **Trust**
6. ئەپەکە لە ئایفۆن دەبینیت — کرایەوە، بەکاری دەکەیت

### سنووری هەژماری خۆڕایی Apple ID

| بەند | بەها |
| --- | --- |
| ماوەی ئیمزا | **٧ ڕۆژ** — دواتر دووبارە ئیمزا بکە (هەمان Sideloadly) |
| ژمارەی ئەپ | حەدئەقەل ٣ ئەپ بە یەک هەژمار |
| ئامێر | تەنها ئامێرەکانی خۆت |

بۆ هەمیشەیی بێ ٧-ڕۆژ: **Apple Developer Program** (ساڵانە) → ئەوکات
Sideloadly بە هەمان شێوە بەکاردێت، تەنها ئیمزا ماوەی درێژترە و TestFlight
بەکاردێت.

### جێگرەوەی Sideloadly: AltStore

- altstore.io → AltServer for Windows → ئامادەکاری وەک سەرەوە
- AltStore خۆی دووبارە-ئیمزا ئەۆتۆماتیک دەکات کە هەمان وایفای لەگەڵ ئایفۆنت هەبێت

## هەنگاوی ٣ — تاقیکردنەوەی یەکەم

کاتێک ئەپەکە کرایەوە یەکەم جار:
1. شاشەی **PIN setup** دەردەکەوێت → PIN ی ٤-١٢ ژمارە دانێ
2. تاپی **Judge** → Competition ID + Judge ID → وێنە هەڵبژێرە → کرۆشهیر دابنێ → Save
3. تاپی **Compare** → کۆنسیvensus و پەسەندکردن
4. تاپی **AI** → پێشنیار (جیاواز لە سەرپەکشەکان)

## پاراستنی کۆمپیوتەرەکەت (گرنگ!)

- **هەرگیز** ووشەی نهێنی RDP یان IP ەکەت بۆ کەسێک نەنێرە (لەوانە ئێمە — پێویستمان پێی نییە)
- RDP: وشەی نهێنی بەهێز + Network Level Authentication چالاک بێت + فایەروۆڵ پۆرتی 3389 سنوور بکە بۆ IP ی خۆت
- Windows Update چالاک بێت

## کێشە؟

- Sideloadly هەڵەی ئیمزا: هەژمارەکە لە appleid.apple.com چالاک بێت + ئایفۆن Time/Date خۆکار بێت
- "Free account provisioning failed": یەک ڕۆژ چاوەڕوان بە یان هەژماری تر بەکاربهێنە (سنووری Apple)
- ئەپ دانەمەزرا: Device Management → Trust دووبارە بکە

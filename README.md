
# DartKT

A dart library for lazier programmers.

## Getting Started

Add dependence of ```dartkt``` to your project. The last version is ```1.0.2``` .

```
dependencies:
    ... ...
    dartkt: ^1.0.2
```

## Functions

Functions in the library are ported from kotlin, also included some useful utils like http.

Here is a list for cognition:

| Class | Method | Definition | Note |
| :-- | :-- | :-- | :-- |
| KTObjectExtension | also | T also(void Function(T) block) | |
| | let | R let&lt;R&gt;(R Function(T) block) | |
| | takeIf | T takeIf(bool Function(T) block) | |
| | takeUnless | T takeUnless(bool Function(T) block) | |
| HttpMethod | | GET, HEAD, POST, PUT, DELETE | |
| HttpResponse | | | |
| HttpError | | | |
| http | http | Future&lt;HttpResponse&gt; http(String url, HttpMethod method, {Map&lt;String, String&gt; param,String mimeType='application/json', String body, Map&lt;String, String&gt; postParam, Map&lt;String, String&gt; fileParam, Map&lt;String, String&gt; headers, int timeout=15}) | |
| | httpGet | Future&lt;HttpResponse&gt; httpGet(String url, {Map&lt;String, String&gt; param, Map&lt;String, String&gt; headers}) | |
| | httpPost | Future&lt;HttpResponse&gt; httpPost(String url, {Map&lt;String, String&gt; param, String body, Map&lt;String, String&gt; headers}) | |
| DownloadState | | Start, Progress, Complete, Error | |
| DownloadCallback | | void Function(DownloadState state, int position, int filesize, String error) | |
| download | download | Future&lt;bool&gt; download(String url, String localFile, DownloadCallback callback) | |
| KTPair | toList | List&lt;T&gt; toList() | |
| KTTriple | toList | List&lt;A&gt; toList() | |
| KTStringExtension | substringBefore | String substringBefore(Pattern pattern) | |
| | substringAfter | String substringAfter(Pattern pattern) | |
| | substringBeforeLast | String substringBeforeLast(Pattern pattern) | |
| | substringAfterLast | String substringAfterLast(Pattern pattern) | |
| | removeRange | String removeRange(int startIdx, int endIdx) | |
| | removePrefix | String removePrefix(Pattern pattern) | |
| | removeSuffix | String removeSuffix(Pattern pattern) | |
| | removeSurrounding | String removeSurrounding(Pattern pattern) | |
| | replaceBefore | String replaceBefore(Pattern pattern, String replacement) | |
| | replaceAfter | String replaceAfter(Pattern pattern, String replacement) | |
| | replaceAfterLast | String replaceAfterLast(Pattern pattern, String replacement) | |
| | replaceBeforeLast | String replaceBeforeLast(Pattern pattern, String replacement) | |
| | lines | List&lt;String&gt; lines() | |
| | drop | String drop(int n) | |
| | dropLast | String dropLast(int n) | |
| | filter | String filter(bool Function(String) block) | |
| | filterIndexed | String filterIndexed(bool Function(int, String) block) | |
| | filterNot | String filterNot(bool Function(String) block) | |
| | reversed | String reversed() | |
| | toList | List&lt;String&gt; toList() | |
| | map | List&lt;T&gt; map&lt;T&gt;(T Function(String) block) | |
| | mapIndexed | List&lt;T&gt; mapIndexed&lt;T&gt;(T Function(int, String) block) | |
| | forEach | forEach(void Function(String) action) | |
| | forEachIndexed | forEachIndexed(void Function(int, String) action) | |
| | reduce | String reduce(String Function(String, String) block) | |
| | reduceIndexed | String reduceIndexed(String Function(int, String, String) block) | |
| | toInt | int toInt() | |
| | toDouble | double toDouble() | |
| | toBool | bool toBool() | |
| | base64encode | String base64encode() | |
| | base64decode | String base64decode() | |
| | toIntList | List&lt;int&gt; toIntList() | |
| | lastPathPart | String lastPathPart() | |
| | getPathDirectory | String getPathDirectory() | |
| | toJsonEncoded | String toJsonEncoded() | |
| | toTitleUpperCase | String toTitleUpperCase() | |
| | appendPathPart | String appendPathPart(String part) | |
| | extension | String extension() | |
| | replaceTag | String replaceTag(String tag, String Function() block) | |
| | skipEmptyLine | String skipEmptyLine() | |
| | toPair | KTPair&lt;String, String&gt; toPair() | |
| | save | save(File f) | |
| | asFileWriteText | File asFileWriteText(String s) | |
| | asFileReadText | String asFileReadText() | |
| | asFileMkdirs | asFileMkdirs() | |
| | asFile | File asFile() | |
| | hash | String hash([String alg]) | |
| | md5sha1 | String get md5sha1 | |
| KTListExtension&lt;T&gt; | find | T find(bool Function(T) block) | |
| | findLast | T findLast(bool Function(T) block) | |
| | indexOfFirst | int indexOfFirst(bool Function(T) block) | |
| | indexOfLast | int indexOfLast(bool Function(T) block) | |
| | drop | List&lt;T&gt; drop(int n) | |
| | dropLast | List&lt;T&gt; dropLast(int n) | |
| | filter | List&lt;T&gt; filter(bool Function(T) block) | |
| | filterIndexed | List&lt;T&gt; filterIndexed(bool Function(int, T) block) | |
| | filterNot | List&lt;T&gt; filterNot(bool Function(T) block) | |
| | slice | List&lt;T&gt; slice(int startIdx, int endIdx) | |
| | sortBy | List&lt;T&gt; sortBy(int Function(T, T) block) | |
| | sortByDescending | List&lt;T&gt; sortByDescending(int Function(T, T) block) | |
| | map2 | List&lt;R&gt; map2&lt;R&gt;(R Function(T) block) | overrided |
| | map2Indexed | List&lt;R&gt; map2Indexed&lt;R&gt;(R Function(int, T) block) | |
| | distinct | List&lt;T&gt; distinct() | |
| | distinctBy | List&lt;T&gt; distinctBy&lt;R&gt;(R Function(T) block) | |
| | all | bool all(bool Function(T) block) | |
| | any | bool any(bool Function(T) block) | |
| | count | int count(bool Function(T) block) | |
| | forEachIndexed | forEachIndexed(void Function(int, T) block) | |
| | none | bool none(bool Function(T) block) | |
| | reduceIndexed | T reduceIndexed(T Function(int, T, T) block) | |
| | minus | minus(List&lt;T&gt; list) | |
| | joinToString | String joinToString([String sep = ',', String Function(T) block]) | |
| | toStringList | List&lt;String&gt; toStringList() | |
| | toMap | Map&lt;K, V&gt; toMap&lt;K, V&gt;() | |
| | mapTo | C mapTo&lt;R, C extends List&lt;R&gt;&gt;(C dest, R Function(T)) | |
| | mapIndexedTo | C mapIndexedTo&lt;R, C extends List&lt;R&gt;&gt;(C dest, R Function(int, T) block) | |
| | filterTo | C filterTo&lt;C extends List&lt;T&gt;&gt;(C dest, bool Function(T) block) | |
| | filterIndexedTo | C filterIndexedTo&lt;C extends List&lt;T&gt;&gt;(C dest, bool Function(int, T) block) | |
| | filterNotTo | C filterNotTo&lt;C extends List&lt;T&gt;&gt;(C dest, bool Function(T) block) | |
| | toGridData | List&lt;List&lt;T&gt;&gt; toGridData([int column = 1]) | |
| KTListListExtension&lt;T&gt; | toListData | List&lt;T&gt; toListData() | |
| KTSetExtension&lt;T&gt; | find | T find(bool Function(T) block) | |
| | findLast | T findLast(bool Function(T) block) | |
| | indexOfFirst | int indexOfFirst(bool Function(T) block) | |
| | indexOfLast | int indexOfLast(bool Function(T) block) | |
| | drop | Set&lt;T&gt; drop(int n) | |
| | dropLast | Set&lt;T&gt; dropLast(int n) | |
| | filter | Set&lt;T&gt; filter(bool Function(T) block) | |
| | filterIndexed | Set&lt;T&gt; filterIndexed(bool Function(int, T) block) | |
| | filterNot | Set&lt;T&gt; filterNot(bool Function(T) block) | |
| | slice | Set&lt;T&gt; slice(int startIdx, int endIdx) | |
| | sortBy | Set&lt;T&gt; sortBy(int Function(T, T) block) | |
| | sortByDescending | Set&lt;T&gt; sortByDescending(int Function(T, T) block) | |
| | map2 | Set&lt;R&gt; map2&lt;R&gt;(R Function(T) block) | overrided |
| | map2Indexed | Set&lt;R&gt; map2Indexed&lt;R&gt;(R Function(int, T) block) | |
| | distinct | Set&lt;T&gt; distinct() | |
| | distinctBy | Set&lt;T&gt; distinctBy&lt;R&gt;(R Function(T) block) | |
| | all | bool all(bool Function(T) block) | |
| | any | bool any(bool Function(T) block) | |
| | count | int count(bool Function(T) block) | |
| | forEachIndexed | forEachIndexed(void Function(int, T) block) | |
| | none | bool none(bool Function(T) block) | |
| | reduceIndexed | T reduceIndexed(T Function(int, T, T) block) | |
| | minus | minus(Set&lt;T&gt; s) | |
| | joinToString | String joinToString([String sep = ',', String Function(T) block]) | |
| | toStringList | Set&lt;String&gt; toStringList() | |
| | toMap | Map&lt;K, V&gt; toMap&lt;K, V&gt;() | |
| | mapTo | C mapTo&lt;R, C extends Set&lt;R&gt;&gt;(C dest, R Function(T) block) | |
| | mapIndexedTo | C mapIndexedTo&lt;R, C extends Set&lt;R&gt;&gt;(C dest, R Function(int, T) block) | |
| | filterTo | C filterTo&lt;C extends Set&lt;T&gt;&gt;(C dest, bool Function(T) block) | |
| | filterIndexedTo | C filterIndexedTo&lt;C extends Set&lt;T&gt;&gt;(C dest, bool Function(int, T) block) | |
| | filterNotTo | C filterNotTo&lt;C extends Set&lt;T&gt;&gt;(C dest, bool Function(T) block) | |
| KTMapExtension&lt;K, V&gt; | toList | List&lt;KTPair&lt;K, V&gt;&gt; toList() | |
| | mapToList | List&lt;R&gt; mapToList&lt;R&gt;(R Function(MapEntry&lt;K, V&gt;) block)| |
| | forEachEntry | forEachEntry(void Function(MapEntry&lt;K, V&gt;) block) | |
| | all | bool all(bool Function(MapEntry&lt;K, V&gt;) block) | |
| | any | bool any(bool Function(MapEntry&lt;K, V&gt;) block) | |
| | count | int count(bool Function(MapEntry&lt;K, V&gt;) block) | |
| | none | bool none(bool Function(MapEntry&lt;K, V&gt;) block) | |
| | filterKeys | Map&lt;K, V&gt; filterKeys(bool Function(K) block) | |
| | filterValues | Map&lt;K, V&gt; filterValues(bool Function(V) block) | |
| | filter | Map&lt;K, V&gt; filter(bool Function(MapEntry&lt;K, V&gt;) block) | |
| | filterNot | Map&lt;K, V&gt; filterNot(bool Function(MapEntry&lt;K, V&gt;) block) | |
| | add | add(Map&lt;K, V&gt; m) |  |
| | minus | minus(Map&lt;K, V&gt; m) |  |
| | filterTo | Map&lt;K, V&gt; filterTo&lt;M extends Map&lt;K, V&gt;&gt;(M dest, bool Function(MapEntry&lt;K, V&gt;) block) | |
| | filterNotTo | Map&lt;K, V&gt; filterNotTo&lt;M extends Map&lt;K, V&gt;&gt;(M dest, bool Function(MapEntry&lt;K, V&gt;) block) | |
| | filterKeysTo | Map&lt;K, V&gt; filterKeysTo&lt;M extends Map&lt;K, V&gt;&gt;(M dest, bool Function(K) block) | |
| | filterValuesTo | Map&lt;K, V&gt; filterValuesTo&lt;M extends Map&lt;K, V&gt;&gt;(M dest, bool Function(V) Block) | |
| | mapTo | Map&lt;K2, V2&gt; mapTo&lt;K2, V2, C extends Map&lt;K2, V2&gt;&gt;(C dest, MapEntry&lt;K2, V2&gt; Function(MapEntry&lt;K, V&gt;) block) | |
| | mapToListTo | List&lt;R&gt; mapToListTo&lt;R, C extends List&lt;R&gt;&gt;(C dest, R Function(MapEntry&lt;K, V&gt;) block) | |
| | mapKeysTo | Map&lt;K2, V2&gt; mapKeysTo&lt;K2, V2, C extends Map&lt;K2, V2&gt;&gt;(C dest, MapEntry&lt;K2, V2&gt; Function(K) block) | |
| | mapKeysToListTo | List&lt;R&gt; mapKeysToListTo&lt;R, C extends List&lt;R&gt;&gt;(C dest, R Function(K) block) | |
| | mapValuesTo | Map&lt;K2, V2&gt; mapValuesTo&lt;K2, V2, C extends Map&lt;K2, V2&gt;&gt;(C dest, MapEntry&lt;K2, V2&gt; Function(V) block) | |
| | mapValuesToListTo | List&lt;R&gt; mapValuesToListTo&lt;R, C extends List&lt;R&gt;&gt;(C dest, R Function(V) block) | |
| RegexUtil | isStringReg | bool isStringReg(String str, int type) | |
| | isNumberReg | bool isNumberReg(String str, int type) | |
| | isEmail | bool isEmail(String str) | |
| | isPhoneNumber | bool isPhoneNumber(String str) | |
| | isCellPhoneNumber | bool isCellPhoneNumber(String str) | |
| | isChinesePhoneNumber | bool isChinesePhoneNumber(String str) | |
| | isIdCardNumber | bool isIdCardNumber(String str) | |
| | isShortIdCardNumber | bool isShortIdCardNumber(String str) | |
| | isUrl | bool isUrl(String str) | |
| | isDomain | bool isDomain(String str) | |
| | isValidAccount | bool isValidAccount(String str) | |
| | isValidPassword | bool isValidPassword(String str) | |
| | isStrongPassword | bool isStrongPassword(String str) | |
| | isDate | bool isDate(String str) | |
| | isValidXml | bool isValidXml(String str) | |
| | isBlankLine | bool isBlankLine(String str) | |
| | isValidHtml | bool isValidHtml(String str) | |
| | isValidQQNumber | bool isValidQQNumber(String str) | |
| | isValidPostCode | bool isValidPostCode(String str) | |
| | isValidIPAddress | bool isValidIPAddress(String str) | |

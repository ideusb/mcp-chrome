# Chrome MCP Bridge 瀹夎鎸囧崡

鏈枃妗ｈ缁嗚鏄庝簡 Chrome MCP Bridge 鐨勫畨瑁呭拰娉ㄥ唽娴佺▼銆?

## 瀹夎娴佺▼姒傝堪

Chrome MCP Bridge 鐨勫畨瑁呭拰娉ㄥ唽娴佺▼濡備笅锛?

```
npm install -g h88-chrome-mcp-bridge
鈹斺攢 postinstall.js
   鈹溾攢 澶嶅埗鍙墽琛屾枃浠跺埌 npm_prefix/bin   鈫?鎬绘槸鍙啓锛堢敤鎴锋垨root鏉冮檺锛?
   鈹溾攢 灏濊瘯鐢ㄦ埛绾у埆娉ㄥ唽                  鈫?鏃犻渶sudo锛屽ぇ澶氭暟鎯呭喌涓嬫垚鍔?
   鈹斺攢 濡傛灉澶辫触 鉃?鎻愮ず鐢ㄦ埛杩愯 h88-chrome-mcp-bridge register --system
      鈹斺攢 闇€瑕佹墜鍔ㄤ娇鐢ㄧ鐞嗗憳鏉冮檺杩愯
```

涓婇潰鐨勬祦绋嬪浘灞曠ず浜嗕粠鍏ㄥ眬瀹夎寮€濮嬶紝鍒版渶缁堝畬鎴愭敞鍐岀殑瀹屾暣杩囩▼銆?

## 璇︾粏瀹夎姝ラ

### 1. 鍏ㄥ眬瀹夎

```bash
npm install -g h88-chrome-mcp-bridge
```

瀹夎瀹屾垚鍚庯紝绯荤粺浼氳嚜鍔ㄥ皾璇曞湪鐢ㄦ埛鐩綍涓敞鍐?Native Messaging 涓绘満銆傝繖涓嶉渶瑕佺鐞嗗憳鏉冮檺锛屾槸鎺ㄨ崘鐨勫畨瑁呮柟寮忋€?

### 2. 鐢ㄦ埛绾у埆娉ㄥ唽

鐢ㄦ埛绾у埆娉ㄥ唽浼氬湪浠ヤ笅浣嶇疆鍒涘缓娓呭崟鏂囦欢锛?

```
娓呭崟鏂囦欢浣嶇疆
鈹溾攢 鐢ㄦ埛绾у埆锛堟棤闇€绠＄悊鍛樻潈闄愶級
鈹? 鈹溾攢 Windows: %APPDATA%\Google\Chrome\NativeMessagingHosts\
鈹? 鈹溾攢 macOS:   ~/Library/Application Support/Google/Chrome/NativeMessagingHosts/
鈹? 鈹斺攢 Linux:   ~/.config/google-chrome/NativeMessagingHosts/
鈹?
鈹斺攢 绯荤粺绾у埆锛堥渶瑕佺鐞嗗憳鏉冮檺锛?
   鈹溾攢 Windows: %ProgramFiles%\Google\Chrome\NativeMessagingHosts\
   鈹溾攢 macOS:   /Library/Google/Chrome/NativeMessagingHosts/
   鈹斺攢 Linux:   /etc/opt/chrome/native-messaging-hosts/
```

濡傛灉鑷姩娉ㄥ唽澶辫触锛屾垨鑰呮偍鎯虫墜鍔ㄦ敞鍐岋紝鍙互杩愯锛?

```bash
h88-chrome-mcp-bridge register
```

**鎺ㄨ崘锛氳繍琛岃瘖鏂伐鍏锋鏌ラ棶棰橈細**

```bash
h88-chrome-mcp-bridge doctor
```

### 3. 绯荤粺绾у埆娉ㄥ唽

濡傛灉鐢ㄦ埛绾у埆娉ㄥ唽澶辫触锛堜緥濡傦紝鐢变簬鏉冮檺闂锛夛紝鎮ㄥ彲浠ュ皾璇曠郴缁熺骇鍒敞鍐屻€傜郴缁熺骇鍒敞鍐岄渶瑕佺鐞嗗憳鏉冮檺锛屼絾鎴戜滑鎻愪緵浜嗕袱绉嶄究鎹风殑鏂瑰紡鏉ュ畬鎴愯繖涓€杩囩▼銆?

绯荤粺绾у埆娉ㄥ唽鏈変袱绉嶆柟寮忥細

#### 鏂瑰紡涓€锛氫娇鐢?`--system` 鍙傛暟锛堟帹鑽愶級

```bash
# macOS/Linux
sudo h88-chrome-mcp-bridge register --system

# Windows (浠ョ鐞嗗憳韬唤杩愯鍛戒护鎻愮ず绗?
h88-chrome-mcp-bridge register --system
```

绯荤粺绾у畨瑁呴渶瑕佺鐞嗗憳鏉冮檺鎵嶈兘鍐欏叆绯荤粺鐩綍鍜屾敞鍐岃〃銆?

#### 鏂瑰紡浜岋細鐩存帴浣跨敤绠＄悊鍛樻潈闄?

**Windows**锛?
浠ョ鐞嗗憳韬唤杩愯鍛戒护鎻愮ず绗︽垨 PowerShell锛岀劧鍚庢墽琛岋細

```
h88-chrome-mcp-bridge register
```

**macOS/Linux**锛?
浣跨敤 sudo 鍛戒护锛?

```
sudo h88-chrome-mcp-bridge register
```

## 娉ㄥ唽娴佺▼璇﹁В

### 娉ㄥ唽娴佺▼鍥?

```
娉ㄥ唽娴佺▼
鈹溾攢 鐢ㄦ埛绾у埆娉ㄥ唽 (h88-chrome-mcp-bridge register)
鈹? 鈹溾攢 鑾峰彇鐢ㄦ埛绾у埆娓呭崟璺緞
鈹? 鈹溾攢 鍒涘缓鐢ㄦ埛鐩綍
鈹? 鈹溾攢 鐢熸垚娓呭崟鍐呭
鈹? 鈹溾攢 鍐欏叆娓呭崟鏂囦欢
鈹? 鈹斺攢 Windows骞冲彴锛氬垱寤虹敤鎴风骇娉ㄥ唽琛ㄩ」
鈹?
鈹斺攢 绯荤粺绾у埆娉ㄥ唽 (h88-chrome-mcp-bridge register --system)
   鈹溾攢 妫€鏌ユ槸鍚︽湁绠＄悊鍛樻潈闄?
   鈹? 鈹溾攢 鏈夋潈闄?鈫?鐩存帴鍒涘缓绯荤粺鐩綍鍜屽啓鍏ユ竻鍗?
   鈹? 鈹斺攢 鏃犳潈闄?鈫?鎻愮ず鐢ㄦ埛浣跨敤绠＄悊鍛樻潈闄愯繍琛?
   鈹斺攢 Windows骞冲彴锛氬垱寤虹郴缁熺骇娉ㄥ唽琛ㄩ」
```

### 娓呭崟鏂囦欢缁撴瀯

```
manifest.json
鈹溾攢 name: "com.chromemcp.nativehost"
鈹溾攢 description: "Node.js Host for Browser Bridge Extension"
鈹溾攢 path: "/path/to/run_host.sh"       鈫?鍚姩鑴氭湰璺緞
鈹溾攢 type: "stdio"                      鈫?閫氫俊绫诲瀷
鈹斺攢 allowed_origins: [                 鈫?鍏佽杩炴帴鐨勬墿灞?
   "chrome-extension://鎵╁睍ID/"
]
```

### 鐢ㄦ埛绾у埆娉ㄥ唽娴佺▼

1. 纭畾鐢ㄦ埛绾у埆娓呭崟鏂囦欢璺緞
2. 鍒涘缓蹇呰鐨勭洰褰?
3. 鐢熸垚娓呭崟鍐呭锛屽寘鎷細
   - 涓绘満鍚嶇О
   - 鎻忚堪
   - Node.js 鍙墽琛屾枃浠惰矾寰?
   - 閫氫俊绫诲瀷锛坰tdio锛?
   - 鍏佽鐨勬墿灞?ID
   - 鍚姩鍙傛暟
4. 鍐欏叆娓呭崟鏂囦欢
5. 鍦?Windows 涓婏紝杩樹細鍒涘缓鐩稿簲鐨勬敞鍐岃〃椤?

### 绯荤粺绾у埆娉ㄥ唽娴佺▼

1. 妫€娴嬫槸鍚﹀凡鏈夌鐞嗗憳鏉冮檺
2. 濡傛灉宸叉湁绠＄悊鍛樻潈闄愶細
   - 鐩存帴鍒涘缓绯荤粺绾х洰褰?
   - 鍐欏叆娓呭崟鏂囦欢
   - 璁剧疆閫傚綋鐨勬潈闄?
   - 鍦?Windows 涓婂垱寤虹郴缁熺骇娉ㄥ唽琛ㄩ」
3. 濡傛灉娌℃湁绠＄悊鍛樻潈闄愶細
   - 鎻愮ず鐢ㄦ埛浣跨敤绠＄悊鍛樻潈闄愰噸鏂拌繍琛屽懡浠?
   - macOS/Linux: `sudo h88-chrome-mcp-bridge register --system`
   - Windows: 浠ョ鐞嗗憳韬唤杩愯鍛戒护鎻愮ず绗?

## 楠岃瘉瀹夎

### 楠岃瘉娴佺▼鍥?

```
楠岃瘉瀹夎
鈹溾攢 妫€鏌ユ竻鍗曟枃浠?
鈹? 鈹溾攢 鏂囦欢瀛樺湪 鈫?妫€鏌ュ唴瀹规槸鍚︽纭?
鈹? 鈹斺攢 鏂囦欢涓嶅瓨鍦?鈫?閲嶆柊瀹夎
鈹?
鈹溾攢 妫€鏌hrome鎵╁睍
鈹? 鈹溾攢 鎵╁睍宸插畨瑁?鈫?妫€鏌ユ墿灞曟潈闄?
鈹? 鈹斺攢 鎵╁睍鏈畨瑁?鈫?瀹夎鎵╁睍
鈹?
鈹斺攢 娴嬭瘯杩炴帴
   鈹溾攢 杩炴帴鎴愬姛 鈫?瀹夎瀹屾垚
   鈹斺攢 杩炴帴澶辫触 鈫?妫€鏌ラ敊璇棩蹇?鈫?鍙傝€冩晠闅滄帓闄?
```

### 楠岃瘉姝ラ

瀹夎瀹屾垚鍚庯紝鎮ㄥ彲浠ラ€氳繃浠ヤ笅鏂瑰紡楠岃瘉瀹夎鏄惁鎴愬姛锛?

1. 妫€鏌ユ竻鍗曟枃浠舵槸鍚﹀瓨鍦ㄤ簬鐩稿簲鐩綍
   - 鐢ㄦ埛绾у埆锛氭鏌ョ敤鎴风洰褰曚笅鐨勬竻鍗曟枃浠?
   - 绯荤粺绾у埆锛氭鏌ョ郴缁熺洰褰曚笅鐨勬竻鍗曟枃浠?
   - 纭娓呭崟鏂囦欢鍐呭鏄惁姝ｇ‘

2. 鍦?Chrome 涓畨瑁呭搴旂殑鎵╁睍
   - 纭繚鎵╁睍宸叉纭畨瑁?
   - 纭繚鎵╁睍鏈?`nativeMessaging` 鏉冮檺

3. 灏濊瘯閫氳繃鎵╁睍杩炴帴鍒版湰鍦版湇鍔?
   - 浣跨敤鎵╁睍鐨勬祴璇曞姛鑳藉皾璇曡繛鎺?
   - 妫€鏌?Chrome 鐨勬墿灞曟棩蹇楁槸鍚︽湁閿欒淇℃伅

## 鏁呴殰鎺掗櫎

### 鏁呴殰鎺掗櫎娴佺▼鍥?

```
鏁呴殰鎺掗櫎
鈹溾攢 鏉冮檺闂
鈹? 鈹溾攢 妫€鏌ョ敤鎴锋潈闄?
鈹? 鈹? 鈹溾攢 鏈夎冻澶熸潈闄?鈫?妫€鏌ョ洰褰曟潈闄?
鈹? 鈹? 鈹斺攢 鏃犺冻澶熸潈闄?鈫?灏濊瘯绯荤粺绾у埆瀹夎
鈹? 鈹?
鈹? 鈹溾攢 鎵ц鏉冮檺闂 (macOS/Linux)
鈹? 鈹? 鈹溾攢 "Permission denied" 閿欒
鈹? 鈹? 鈹溾攢 "Native host has exited" 閿欒
鈹? 鈹? 鈹斺攢 杩愯 h88-chrome-mcp-bridge fix-permissions
鈹? 鈹?
鈹? 鈹斺攢 灏濊瘯 h88-chrome-mcp-bridge register --system
鈹?
鈹溾攢 璺緞闂
鈹? 鈹溾攢 妫€鏌ode.js瀹夎 (node -v)
鈹? 鈹斺攢 妫€鏌ュ叏灞€NPM璺緞 (npm root -g)
鈹?
鈹溾攢 娉ㄥ唽琛ㄩ棶棰?(Windows)
鈹? 鈹溾攢 妫€鏌ユ敞鍐岃〃璁块棶鏉冮檺
鈹? 鈹斺攢 灏濊瘯鎵嬪姩鍒涘缓娉ㄥ唽琛ㄩ」
鈹?
鈹斺攢 鍏朵粬闂
   鈹溾攢 妫€鏌ユ帶鍒跺彴閿欒淇℃伅
   鈹斺攢 鎻愪氦Issue鍒伴」鐩粨搴?
```

### 甯歌闂瑙ｅ喅姝ラ

濡傛灉瀹夎杩囩▼涓亣鍒伴棶棰橈紝璇峰皾璇曚互涓嬫楠わ細

1. 纭繚 Node.js 宸叉纭畨瑁?
   - 杩愯 `node -v` 鍜?`npm -v` 妫€鏌ョ増鏈?
   - 纭繚 Node.js 鐗堟湰 >= 20.x

2. 妫€鏌ユ槸鍚︽湁瓒冲鐨勬潈闄愬垱寤烘枃浠跺拰鐩綍
   - 鐢ㄦ埛绾у埆瀹夎闇€瑕佸鐢ㄦ埛鐩綍鏈夊啓鍏ユ潈闄?
   - 绯荤粺绾у埆瀹夎闇€瑕佺鐞嗗憳/root鏉冮檺

3. **淇鎵ц鏉冮檺闂**

   **macOS/Linux 骞冲彴**锛?

   **闂鎻忚堪**锛?
   - npm 瀹夎閫氬父浼氫繚鐣欐枃浠舵潈闄愶紝浣?pnpm 鍙兘涓嶄細
   - 鍙兘閬囧埌 "Permission denied" 鎴?"Native host has exited" 閿欒
   - Chrome 鎵╁睍鏃犳硶鍚姩 native host 杩涚▼

   **瑙ｅ喅鏂规**锛?

   a) **浣跨敤鍐呯疆淇鍛戒护锛堟帹鑽愶級**锛?

   ```bash
   h88-chrome-mcp-bridge fix-permissions
   ```

   b) **杩愯璇婃柇宸ュ叿鑷姩淇**锛?

   ```bash
   h88-chrome-mcp-bridge doctor --fix
   ```

   c) **鎵嬪姩璁剧疆鏉冮檺**锛?

   ```bash
   # 鏌ユ壘瀹夎璺緞
   npm list -g h88-chrome-mcp-bridge
   # 鎴栬€呭浜?pnpm
   pnpm list -g h88-chrome-mcp-bridge

   # 璁剧疆鎵ц鏉冮檺锛堟浛鎹负瀹為檯璺緞锛?
   chmod +x /path/to/node_modules/h88-chrome-mcp-bridge/run_host.sh
   chmod +x /path/to/node_modules/h88-chrome-mcp-bridge/index.js
   chmod +x /path/to/node_modules/h88-chrome-mcp-bridge/cli.js
   ```

   **Windows 骞冲彴**锛?

   **闂鎻忚堪**锛?
   - Windows 涓?`.bat` 鏂囦欢閫氬父涓嶉渶瑕佹墽琛屾潈闄愶紝浣嗗彲鑳介亣鍒板叾浠栭棶棰?
   - 鏂囦欢鍙兘琚爣璁颁负鍙
   - 鍙兘閬囧埌 "Access denied" 鎴栨枃浠舵棤娉曟墽琛岀殑閿欒

   **瑙ｅ喅鏂规**锛?

   a) **浣跨敤鍐呯疆淇鍛戒护锛堟帹鑽愶級**锛?

   ```cmd
   h88-chrome-mcp-bridge fix-permissions
   ```

   b) **杩愯璇婃柇宸ュ叿鑷姩淇**锛?

   ```cmd
   h88-chrome-mcp-bridge doctor --fix
   ```

   c) \**鎵嬪姩妫€鏌ユ枃浠跺睘鎬?*锛?

   ```cmd
   # 鏌ユ壘瀹夎璺緞
   npm list -g h88-chrome-mcp-bridge

   # 妫€鏌ユ枃浠跺睘鎬э紙鍦ㄦ枃浠惰祫婧愮鐞嗗櫒涓彸閿?-> 灞炴€э級
   # 纭繚 run_host.bat 涓嶆槸鍙鏂囦欢
   ```

   d) \**閲嶆柊瀹夎骞跺己鍒舵潈闄?*锛?

   ```bash
   # 鍗歌浇
   npm uninstall -g h88-chrome-mcp-bridge
   # 鎴?pnpm uninstall -g h88-chrome-mcp-bridge

   # 閲嶆柊瀹夎
   npm install -g h88-chrome-mcp-bridge
   # 鎴?pnpm install -g h88-chrome-mcp-bridge

   # 濡傛灉浠嶆湁闂锛岃繍琛屾潈闄愪慨澶?
   h88-chrome-mcp-bridge fix-permissions
   ```

4. 鍦?Windows 涓婏紝纭繚娉ㄥ唽琛ㄨ闂病鏈夎闄愬埗
   - 妫€鏌ユ槸鍚﹀彲浠ヨ闂?`HKCU\Software\Google\Chrome\NativeMessagingHosts\`
   - 瀵逛簬绯荤粺绾у埆锛屾鏌?`HKLM\Software\Google\Chrome\NativeMessagingHosts\`

5. 灏濊瘯浣跨敤绯荤粺绾у埆瀹夎
   - 浣跨敤 `h88-chrome-mcp-bridge register --system` 鍛戒护
   - 鎴栫洿鎺ヤ娇鐢ㄧ鐞嗗憳鏉冮檺杩愯

6. 妫€鏌ユ帶鍒跺彴杈撳嚭鐨勯敊璇俊鎭?
   - 璇︾粏鐨勯敊璇俊鎭€氬父浼氭寚鍑洪棶棰樻墍鍦?
   - 鍙互娣诲姞 `--verbose` 鍙傛暟鑾峰彇鏇村鏃ュ織淇℃伅

濡傛灉闂浠嶇劧瀛樺湪锛岃鎻愪氦 issue 鍒伴」鐩粨搴擄紝骞堕檮涓婁互涓嬩俊鎭細

- 鎿嶄綔绯荤粺鐗堟湰
- Node.js 鐗堟湰
- 瀹夎鍛戒护
- 閿欒淇℃伅
- 灏濊瘯杩囩殑瑙ｅ喅鏂规硶

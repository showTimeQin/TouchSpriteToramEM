require("TSLib")
require("Tools")
require("720p")
init(1);
width, height = getScreenSize();
local count_JRW = 0 -- 交任务次数
if width ~= 720 or height ~= 1280 then
	toast("width = "..width.."\nheight = "..height)
	toast("本脚本不能在该设备运行")
end

MyJsonString = [[
{
  "style": "default",
  "width": ]]..width..[[,
  "height": ]]..height..[[,
  "config": "save_111.dat",
  "timer": 60,
  "views": [
    {
      "type": "Label",
      "text": "Kami桑的噩梦脚本",
      "size": 25,
      "align": "center",
      "color": "0,0,255"
    },
	{
      "type": "Label",
      "text": "密码",
      "size": 15,
      "align": "center",
      "color": "0,0,0"
    },
	{
      "type": "Edit",
      "text": "1",
      "size": 15,
      "align": "left",
      "color": "0,0,0"
    },
	{
      "type": "Label",
      "text": "版本",
      "size": 15,
      "align": "center",
      "color": "0,0,0"
    },
	{
      "type": "ComboBox",
      "list": "小游,4399",
      "select": "0"
    },
	{
      "type": "ComboBox",
      "list": "正常版本,活动版本,交任务,测试回城,测试清包",
      "select": "0"
    },
	{
      "type": "Label",
      "text": "材料处理方式",
      "size": 15,
      "align": "center",
      "color": "0,0,0"
    },
	{
      "type": "ComboBox",
      "list": "删除,分解",
      "select": "0"
    },
	{
      "type": "Label",
      "text": "传送点位置",
      "size": 15,
      "align": "center",
      "color": "0,0,0" 
    },
	{
      "type": "ComboBox",
      "list": "第一个,第二个,第三个",
      "select": "1"
    }
  ]
}
]]

function beforeUserExit()
	showCount(count_JRW)
end

ret, password, game_version, version, process, position = showUI(MyJsonString);

-- 用户点击退出
if ret == 0 or password ~= "1024" then
	lua_exit();     --退出脚本
	mSleep(10)      --lua 的机制是调用此函数之后的下一行结束，如果不希望出现此情况可以在调用函数之后加入一行无意义代码。
end
mSleep(2000)
if version == "2" then
	nLog("交任务")
	snLog("交任务")
	while true do
		if isColor(641,  626, 0x000000, 95) and isColor(698,  621, 0x1b84ff, 95) then
			tap(698,  621)
			count_JRW = count_JRW + 1
			nLog("得到防裂："..count_JRW)
			snLog("得到防裂："..count_JRW)
			mSleep(1000)
		elseif isColor(628,  629, 0x1b84ff, 95) then
			tap(628,  629)
			count_JRW = count_JRW + 1
			nLog("得到防裂："..count_JRW)
			snLog("得到防裂："..count_JRW)
			mSleep(1000)
			break
		end
	end
elseif version == "3" then
	nLog("开始测试回城")
	snLog("开始测试回城")
	mSleep(1000)
	count_JRW = goToCityJRW(count_JRW)
elseif version == "4" then
	nLog("开始测试清包")
	snLog("开始测试清包")
	mSleep(1000)
	deleteWQ()
else
	nLog("开始噩梦")
	while (true) do
		nightmare(tonumber(position), tonumber(version))
	end
end







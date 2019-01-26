local count_delete = -1

function goToCityJRW(count_JRW)
	goToCity(0)
	moveToDN(3) -- 找到NPC
	snLog("找到NPC")
	mSleep(1000)
	touchN(2) -- 交任务
	snLog("交任务")
	mSleep(1000)
	-- 下划
	snLog("下划")
	for i=1, 2 do
		touchDown(661,  459);    --在坐标 按下
		mSleep(1000);
		for j=459, 113, -10 do
			touchMove(674,  j);    --移动到坐标 ，注意一次滑动的坐标间隔不要太大，不宜超过 50 像素
			mSleep(30)
		end
		mSleep(1000);
		touchUp(674,  113);    --在坐标 抬起
		mSleep(2000)
	end
	
	mSleep(2000)
	tap(634,  308)	-- 点击任务
	snLog("点击任务")
	mSleep(1000)
	touch(1217,   64, 0x8a8253, 95) -- 跳过
	snLog("跳过")
	mSleep(1000)
	touch(827,  298, 0x978062, 95) -- 遵命
	snLog("遵命")
	mSleep(1000)
	touch(1217,   64, 0x8a8253, 95) -- 跳过
	snLog("跳过")
	mSleep(1000)
	touch(827,  298, 0x978062, 95) -- 直接回报
	snLog("直接回报")
	nextNStalk(2)
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
	mSleep(3000)
	return count_JRW
end

function checkEM()
	if count_delete < 2 then
		goToCityJRW()
end

function checkBag()
	tap(61,   59)
	mSleep(2000)
	tap(1090,  161)
	mSleep(2000)
	local x = -1
	local y = -1
	x, y = findMultiColorInRegionFuzzy(0x8c6029, "16|10|0x351d03,15|20| 0x613406,-3|20|0x875924", 95, 678,  138, 1230,  572);
	if x~=-1 and y~=-1 then
		tap(x,  y)
		mSleep(2000)
		tap(296,  222) -- 重排
		mSleep(2000)
		tap(705,  601) -- 确定
		mSleep(1000)
		findColorStop(296,  222, 0x35a9b7, 95)
		tap(645,  119) -- 多选
		mSleep(1000)
		--delete()
		tap(309,  193)
		mSleep(1000)
		tap(791,  601) -- 删除确认
		mSleep(1000)
		toast("背包剩余空位："..count_delete+1)
		snLog("背包剩余空位："..count_delete+1)
		findColorStop(296,  222, 0x35a9b7, 95)
	end
	tap(1223,   65) -- 关闭
end


-- position表示传送点位置，0为第一个，1为第二个，2为第三个
-- version 为0时为正常版本， 为1时为活动版
function nightmare(position, version)
	emLog("开始刷噩梦")
	while true do
		for i=1, 30 do
			nLog("技能")
			tap(1176,  283) -- 技能
			mSleep(500)
			tap(1176,  283)
			mSleep(1000)
			nLog("动作")
			tap(1050,  364) -- 动作
			mSleep(500)
			tap(1050,  364)
			mSleep(1000)
			nLog("充能")
			tap(1179,  173) -- 充能
			mSleep(500)
			tap(1179,  173)
		end
		-- 检查是否压制
		if not isColor(1176,  283, 0x68c99d, 85) then
			closeApp("com.xiaoyou.ToramOnline")
			mSleep(5000)
			runApp("com.xiaoyou.ToramOnline")
			mSleep(2000)
			touch(764,  569, 0x1b84ff, 95)
			mSleep(1000)
			touch(770,  317, 0x8e1c21, 95)
			mSleep(1000)
			
			while not isColor(1176,  283, 0x68c99d, 85) do
				tap(723,  665)
				mSleep(1000)
			end
			mSleep(2000)
		end
		-- 检查清包
		checkBag()
		
		-- 检查噩梦是否满
		checkEM()
	end
end

function showCount(count_JRW)
	
end




--
-- Please see the license.html file included with this distribution for
-- attribution and copyright information.
--

local function getDisplayHour()
	local nHour = DB.getValue('calendar.current.hour', 0)
	return string.format('%2d', nHour)
end

local function getDisplayHourPhase()
	return ''
end

local getTimeString_old
local function getTimeString(nHour, nMinute, ...)
	local sTimeString = getTimeString_old(nHour, nMinute, ...)
	return StringManager.trim(sTimeString)
end

function onInit()
	CalendarManager.getDisplayHour = getDisplayHour
	CalendarManager.getDisplayHourPhase = getDisplayHourPhase

	getTimeString_old = CalendarManager.getTimeString
	CalendarManager.getTimeString = getTimeString
end

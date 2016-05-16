function  getPath(...)
	return (...):match("(.-)[^%.]+$")
end

function table.copy(t)
	local t2 = {}
	for i,v in pairs(t) do
		t2[i] = v
	end
	return t2
end

function table.sum(...)
	local arg = {...}
	local t = {}
	for i,v in ipairs(arg) do
		for j,w in pairs(v) do
			t[j]=w
		end
	end
	return t
end
function  getPath(...)
	return (...):match("(.-)[^%.]+$")
end
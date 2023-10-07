---
--- ProjectName: kong-plugin-url-rewrite
--- Created by rayzh.
--- DateTime: 2023/10/7 11:09
---
local kong = kong
local ngx = ngx

local kong_meta = require("kong.meta")

local UrlRewriteHandler = {
    PRIORITY = 991,
    VERSION = kong_meta.version
}


function UrlRewriteHandler:access(conf)
    local replace,n,err  = ngx.re.sub(ngx.var.request_uri, conf.regex, conf.replacement)
    if replace and n == 0 then
        return
    end

    if err then
        kong.log("url-rewrite plugin error: ",err)
        return
    end

    if conf.flag == "redirect" then
        ngx.redirect(replace, 302)
    elseif conf.flag == "permanent" then
        ngx.redirect(replace, 301)
    end
end

return UrlRewriteHandler
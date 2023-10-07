---
--- ProjectName: kong-plugin-url-rewrite
--- Created by rayzh.
--- DateTime: 2023/10/7 11:09
---

local typedefs = require "kong.db.schema.typedefs"


return {
    name = "url-rewrite",
    fields = {
        { consumer = typedefs.no_consumer },
        { protocols = typedefs.protocols_http },
        { config = {
            type = "record",
            fields = {
                { flag = { description = "Enumeration: permanent｜redirect.", type = "string", default = "permanent"}, },
                { regex = { description = "URI regular expression.", type = "string" }, },
                { replacement = { description = "Target URL.", type = "string" }, },
            }, }, },
    },
}

full_uri_from_request = Field.new("http.request.full_uri")
host_from_request = Field.new("http.host")

tango = Proto("http.query_parameters","Tango")
peticion = ProtoField.string("http.query_parameters.peticion","PETICION")

function tango.dissector(buffer, pinfo, tree) 
         local full_uri_value = full_uri_from_request()
         if full_uri_value then
                 local value = tostring(full_uri_value)
                 local host = host_from_request().value
                 if string.match(host, "tc2.tango.me") then
                    local subtree = tree:add(tango, "Tango Mensaje")
                    subtree:add(peticion,value)
                 end
                 if string.match(host, "simg.tango.me") then
                    local subtree = tree:add(tango, "Tango Sticker")
                    subtree:add(peticion,value)
                 end   
                 if string.match(host, "stickaloger.tango.me") then
                    local subtree = tree:add(tango, "Tango Sticker")
                    subtree:add(peticion,value)
                 end
                 if string.match(host, "surprises.tango.me") then
                    local subtree = tree:add(tango, "Tango Música Spotify")
                    subtree:add(peticion,value)
                 end
                 if string.match(host, "cget.tango.me") then
                    local subtree = tree:add(tango, "Tango Audios")
                    subtree:add(peticion,value)
                 end      
                 if string.match(host, "cput.tango.me") then
                    local subtree = tree:add(tango, "Tango Fotos")
                    subtree:add(peticion,value)
                 end  
         end
end

register_postdissector(tango)

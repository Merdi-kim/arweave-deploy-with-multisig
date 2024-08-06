local json = require("json")

local registry = {
    -- user wallet address -> all his processes
}


Handlers.add("Get-Processes", "Get", function(msg)
    print(json.encode(registry))
end)

Handlers.add("Register-Process", "Register", function(msg)
    local processId = msg.Tags.ProcessId
    local name = msg.Tags.Name 
    local multisig = msg.Tags.Multisig
    assert(#processId == 43, "Invalid process id")
    assert(#name >= 3, "Invalid name")
    local newProcess = {
        id = processId,
        name = name,
        multisig = multisig,
        createdAt = msg.Timestamp
    }
    if not registry[msg.From] then 
        registry[msg.From] = {}
    end
    table.insert(registry[msg.From], newProcess)
end)

Handlers.add("Delete-Process", "Delete", function(msg)
    --here
end)
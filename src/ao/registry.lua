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
        createdAt = msg.Timestamp,
        history = {}
    }
    if not registry[msg.From] then 
        registry[msg.From] = {}
    end
    table.insert(registry[msg.From], newProcess)
end)

Handlers.add("Delete-Process", "Delete", function(msg)
    --here
end)

Handlers.add("Deploy", "Deploy", function(msg)
    local process = msg.Tags.Process 
    local commit = msg.Tags.Commit 
    local project = registry[msg.From]
    for i, v in ipairs(project) do
		if v.id == process then
			table.insert(v.history, {time = msg.Timestamp, msg = commit, author = msg.From})
			return
		end
	end
end)
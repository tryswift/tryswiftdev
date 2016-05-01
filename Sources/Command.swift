import Darwin

func executeCommand(argments args: [String]) -> [String]? {
    var pipe: [Int32] = [0, 0]
    Darwin.pipe(&pipe)
    
    var fileActions: posix_spawn_file_actions_t? = nil
    posix_spawn_file_actions_init(&fileActions)
    
    posix_spawn_file_actions_addopen(&fileActions, 0, "/dev/null", O_RDONLY, 0)
    posix_spawn_file_actions_adddup2(&fileActions, pipe[1], 1)
    
    posix_spawn_file_actions_addclose(&fileActions, pipe[0])
    posix_spawn_file_actions_addclose(&fileActions, pipe[1])
    
    let argv: [UnsafeMutablePointer<CChar>?] = args.map{ $0.withCString(strdup) }
    var pid = pid_t()
    posix_spawnp(&pid, argv[0], &fileActions, nil, argv + [nil], nil)
    posix_spawn_file_actions_destroy(&fileActions)
    
    close(pipe[1])

    let N = 4096
    var buf = [Int8](repeating: 0, count: N + 1)
    
    var n: Int
    var outputStrings = [String]()
    repeat {
        n = read(pipe[0], &buf, N)
        if let output = String(validatingUTF8: buf) {
            outputStrings.append(output)
        }
    } while n > 0
    
    close(pipe[0])
    
    return outputStrings
}

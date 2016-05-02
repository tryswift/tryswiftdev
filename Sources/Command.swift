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

    let bufferSize = 4096
    var buffer = [Int8](repeating: 0, count: bufferSize + 1)
    
    var n: Int
    var outputStrings = [String]()
    
    // FIXME: Return value is not correct value when executing `$ xcodebuild -showBuildSettings`.
    repeat {
        n = read(pipe[0], &buffer, bufferSize)
        if let output = String(validatingUTF8: buffer) {
            outputStrings.append(output)
        }
        buffer = [Int8](repeating: 0, count: bufferSize)
    } while n > 0
    
    close(pipe[0])
    
    return outputStrings
}

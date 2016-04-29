import Darwin

func excuteCommand(argments args: [String]) {
    var fileActions: posix_spawn_file_actions_t? = nil
    posix_spawn_file_actions_init(&fileActions)
    
    let argv: [UnsafeMutablePointer<CChar>?] = args.map{ $0.withCString(strdup) }
    var pid = pid_t()
    posix_spawnp(&pid, argv[0], &fileActions, nil, argv + [nil], nil)
    posix_spawn_file_actions_destroy(&fileActions)
}

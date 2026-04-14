#import "Basic";
#import "Process";

gitf :: () {  ///
    for 0..2 {
        run_command("git", "add", "-A");
        result := run_command("git", "commit", "-m", "f");
        if it && result.exit_code
            assert(false);
        else if !result.exit_code
            break;
    }
    run_command("git", "push");
} ///

main :: () { ///
    args: [..] string;
    args.allocator = temp;
    for get_command_line_arguments() {
        if !it_index
            continue;
        array_add(*args, it);
    }

    if array_find(args, "gitf") {
        gitf();
        return;
    }
} ///
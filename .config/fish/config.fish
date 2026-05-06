if status is-interactive
	if not set -q TMUX
		if not tmux ls
			systemctl --user start tmux.service
		end
		exec tmux attach
	end

	# Commands to run in interactive sessions can go here
	set -gx EDITOR nvim
	set -gx BROWSER firefox
	set -f fish_transient_prompt 1

	set -gx LESS '-R'
	set -gx MANPAGER 'nvim +Man!'
	set -gx PAGER 'page -q 90000'

	# set theme
	fish_config theme choose "TokyoNight Night"

	# aliases
	alias la='eza --all --group-directories-first --long --color=always --icons=always'
	alias lf='eza --oneline --color=never --icons=never --only-files'

end

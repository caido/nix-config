{ config, lib, pkgs, local, ... }:

{
  programs.zsh = {
    enable = true;
    autocd = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;
    
    # Custom prompt configuration
    initContent = ''
      # Enable prompt substitution
      setopt PROMPT_SUBST
      
      # Git status function
      git_status() {
        # Check if we're in a git repository first
        if ! git rev-parse --git-dir > /dev/null 2>&1; then
          return
        fi
        
        # Get current branch
        local branch=$(git symbolic-ref --short HEAD 2>/dev/null)
        
        if [[ -n $$branch ]]; then
          # Check if working directory is dirty
          local dirty=""
          if ! git diff-index --quiet HEAD -- 2>/dev/null || git ls-files --others --exclude-standard 2>/dev/null | grep -q .; then
            dirty=" ↺"
          fi
          
          # Return formatted git info
          echo " %F{magenta}→%f %F{blue}''${branch}%F{grey}''${dirty}%f"
        fi
      }
      
      # Main prompt
      PROMPT='%F{green}%n%f@%F{yellow}%m%f %F{cyan}%~%f$(git_status)
      %F{magenta}❯%f '
      
      # Continuation prompt
      PS2='%F{red}→ %f'

      # Activate mise
      eval "$(mise activate zsh)"
    '';
  };
}

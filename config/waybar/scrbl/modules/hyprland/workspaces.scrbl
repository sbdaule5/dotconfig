"hyprland/workspaces": {
  // "disable-scroll": true,
  // "all-outputs": true,
  // "warp-on-scroll": false,
  "active-only": false,
  "format": "{icon}",
  "format-icons": {
@(define workspaces '(
       ("1" "󰅩 ")
       ("2" "󰣇 ")
       ("3" " ")
       ("4" "󱉟 ")
       ("5" "󰑫 ")
       ("6" " ")
       ("7" " ")
       ("8" "󰊫 ")
       ("9" "󰨇 ")
       ("10" "󰈹 ")
       ("11" "󰅩 ")
       ("12" "󰣇 ")
       ("13" " ")
       ("14" "󱉟 ")
       ("15" "󰑫 ")
       ("16" " ")
       ("17" " ")
       ("18" "󰊫 ")
       ("19" "󰨇 ")
       ("110" "󰈹 ")
             ))
@; Generate output using for/list
@(for/list ([workspace workspaces])
@list{@|"        "| "@(list-ref workspace 0)": "@(list-ref workspace 1)", @|"\n"| })
  },
  "on-scroll-up": "hyprctl dispatch workspace e+1",
  "on-scroll-down": "hyprctl dispatch workspace e-1",
  "persistent-workspaces": {
      "*": [
@(for/list ([i (range 1 11)])
@list{@|"        "| @(if (equal? output "eDP-1") i (format "1~a" i)), @|"\n"|}
   )
      ]
  }
},

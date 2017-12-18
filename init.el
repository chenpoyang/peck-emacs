"---------------------------------------------------------------------------"
;; initialize package.el
(require 'package)
(setq package-enable-at-startup nil)

;; repo lists
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'package-archives '("elpy" . "http://jorgenschaefer.github.io/packages/") t)
;;("marmalade" . "http://marmalade-repo.org/packages/")
;;("melpa-stable" . "http://melpa-stable.milkbox.net/packages/")

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package)
  (setq use-package-always-ensure t))
"---------------------------------------------------------------------------"
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ace-isearch-function (quote avy-goto-char) t)
 '(ace-isearch-input-length 7 t)
 '(ace-isearch-jump-delay 0.25 t)
 '(ace-isearch-use-jump (quote printing-char) t)
 '(column-number-mode t)
 '(custom-safe-themes
   (quote
    ("f8f2d182eabf478f99eb1c84f9a5a12c256aa65de1118b859805ec683873e075" "93aae813276e5add75d9e8e135dd8476cf66257503b3b7d3aaf41f41ccb5fcef" "a950150eef26d7729c31dcc37fc5e91434017dfda8fa1b511f500f58f0852af4" "fc92933088e987e1fa816549aa4a3737e125da7fbb0144b21c4838d7df4f406d" default)))
 '(display-time-mode t)
 '(ecb-layout-name "peck")
 '(ecb-options-version "2.50")
 '(ecb-tip-of-the-day nil)
 '(ediff-split-window-function (quote split-window-horizontally))
 '(exec-path
   (quote
    ("/usr/local/bin" "/opt/local/bin/" "/usr/bin" "/bin" "/usr/sbin" "/sbin" "/Applications/Emacs.app/Contents/MacOS/libexec" "/Applications/Emacs.app/Contents/MacOS/bin")))
 '(helm-boring-buffer-regexp-list
   (quote
    ("\\` " "\\`\\*helm" "\\`\\*Echo Area" "\\`\\*Minibuf" "\\`*magit" "\\`*Ediff")))
 '(helm-boring-file-regexp-list
   (quote
    ("\\.o$" "~$" "\\.bin$" "\\.lbin$" "\\.so$" "\\.a$" "\\.ln$" "\\.blg$" "\\.bbl$" "\\.elc$" "\\.lof$" "\\.glo$" "\\.idx$" "\\.lot$" "\\.svn/\\|\\.svn$" "\\.hg/\\|\\.hg$" "\\.git/\\|\\.git$" "\\.bzr/\\|\\.bzr$" "CVS/\\|CVS$" "_darcs/\\|_darcs$" "_MTN/\\|_MTN$" "\\.fmt$" "\\.tfm$" "\\.class$" "\\.fas$" "\\.lib$" "\\.mem$" "\\.x86f$" "\\.sparcf$" "\\.dfsl$" "\\.pfsl$" "\\.d64fsl$" "\\.p64fsl$" "\\.lx64fsl$" "\\.lx32fsl$" "\\.dx64fsl$" "\\.dx32fsl$" "\\.fx64fsl$" "\\.fx32fsl$" "\\.sx64fsl$" "\\.sx32fsl$" "\\.wx64fsl$" "\\.wx32fsl$" "\\.fasl$" "\\.ufsl$" "\\.fsl$" "\\.dxl$" "\\.lo$" "\\.la$" "\\.gmo$" "\\.mo$" "\\.toc$" "\\.aux$" "\\.cp$" "\\.fn$" "\\.ky$" "\\.pg$" "\\.tp$" "\\.vr$" "\\.cps$" "\\.fns$" "\\.kys$" "\\.pgs$" "\\.tps$" "\\.vrs$" "\\.pyc$" "\\.pyo$")))
 '(helm-ff-skip-boring-files t)
 '(helm-gtags-suggested-key-mapping t)
 '(ns-command-modifier (quote meta))
 '(package-selected-packages
   (quote
    (ace-window ecb neotree chinese-wbim ag ace-isearch rjsx-mode youdao-dictionary xref-js2 which-key web-mode use-package swift-mode sourcemap skewer-mode shackle python-environment org-pomodoro org-bullets nodejs-repl mew magit json-mode js2-refactor indium helm-swoop helm-projectile helm-gtags helm-flyspell helm-ag gorepl-mode gore-mode go-autocomplete ggtags flycheck-swift flycheck-irony erlang emmet-mode elpy doom-themes concurrent composer company-tern company-php company-lua company-irony-c-headers company-irony company-go column-enforce-mode benchmark-init ace-jump-mode ac-php ac-html)))
 '(projectile-globally-ignored-files (quote ("GPATH" "TAGS" "GRTAGS" "GTAGS")))
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil))
"---------------------------------------------------------------------------"
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
"---------------------------------------------------------------------------"
;; calc startup time
(defvar peck-emacs/invokation-time
  (current-time))

;; load configuration files
(load-file "~/.emacs.d/peck-emacs/loadpkgs.el")
(load-file "~/.emacs.d/peck-emacs/config.el")
(load-file "~/.emacs.d/peck-emacs/key-bindings.el")

(print (cl-concatenate 'string
                       "Startup complete in "
                       (number-to-string (cadr (time-subtract(current-time)
                                                             peck-emacs/invokation-time)))
                       " seconds\n\n"
                       "Welcome to Emacs!\n\n"
                       "Today's date: "
                       (format-time-string "%B %d %Y"))
       (get-buffer-create (current-buffer)))
"---------------------------------------------------------------------------"

# Aila OS Gamer (base Bazzite)

É o Bazzite (Fedora, feito para jogos: Steam, Proton, GameMode, MangoHud, drivers, ajustes de kernel já prontos)
com a marca do Aila OS, o visual neon, o Brave e os comandos `aila-jogo` e `aila-turbo`.
O Aila OS normal continua separado, em cima do Debian (pasta `aila-os-v3`).

## 1. Publicar (uma vez)
    cd aila-os-gamer
    git init -b main && git add . && git commit -m "Aila OS Gamer"
    git remote add origin https://github.com/AilaCompanySolutions-Oficial/aila-os-gamer.git
    git push -u origin main
(crie antes o repositório vazio `aila-os-gamer` no GitHub, ou: `gh repo create AilaCompanySolutions-Oficial/aila-os-gamer --public --source . --push`)

O GitHub constrói sozinho (aba **Actions**, ~30-60 min) duas imagens:
`aila-os-gamer` (AMD/Intel) e `aila-os-gamer-nvidia` (NVIDIA).
Quando terminar: GitHub > seu perfil/organização > **Packages** > cada imagem > *Package settings* > **Change visibility: Public**.

## 2. Instalar
1. Baixe o Bazzite em https://bazzite.gg e instale normalmente (escolha a versão para a sua placa de vídeo).
2. No sistema instalado, no terminal:

       sudo bootc switch ghcr.io/ailacompanysolutions-oficial/aila-os-gamer:latest          # AMD / Intel
       sudo bootc switch ghcr.io/ailacompanysolutions-oficial/aila-os-gamer-nvidia:latest   # NVIDIA
       systemctl reboot

   Se o `bootc` não existir: `rpm-ostree rebase ostree-unverified-registry:ghcr.io/ailacompanysolutions-oficial/aila-os-gamer:latest`
3. No primeiro boot com internet o Brave é instalado (log: /var/log/aila-primeiro-boot.log); no primeiro login entra o tema neon.

## 3. Atualizar (git push)
Mude o que quiser (arquivos em `system_files/`, comandos em `build_files/build.sh`) e dê `git push`.
O GitHub reconstrói a imagem; os computadores recebem pelas atualizações do Bazzite (ou `sudo bootc upgrade`).
Se algo quebrar: `sudo bootc rollback` volta à versão anterior.
A imagem também é reconstruída todo dia para acompanhar as novidades do Bazzite.

## 4. ISO própria (opcional)
GitHub > Actions > **Gerar ISO do Aila OS Gamer** > Run workflow. A ISO sai como arquivo do resultado (artifact).

## Comandos
- `aila-jogo %command%` (Steam > Opções de inicialização): GameMode + MangoHud + ntsync. `-g` gamescope, `-n` NVIDIA híbrida, `-f` sem HUD.
- `aila-turbo toggle` (ou menu > Aila Turbo): pausa efeitos e indexação, perfil de desempenho.

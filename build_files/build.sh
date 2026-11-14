#!/bin/bash
# Roda dentro da construção da imagem (no GitHub). Só mexe em marca e extras; o resto é Bazzite.
set -euxo pipefail

chmod +x /usr/bin/aila-* /usr/libexec/aila-* 2>/dev/null || true

# ---- Marca: Aila OS Gamer (mantém ID/VARIANT_ID do Bazzite para os scripts dele continuarem funcionando) ----
for f in /usr/lib/os-release /etc/os-release; do
  [ -e "$f" ] || continue
  real="$(readlink -f "$f")"
  sed -i -E \
    -e 's/^NAME=.*/NAME="Aila OS Gamer"/' \
    -e 's/^PRETTY_NAME=.*/PRETTY_NAME="Aila OS Gamer"/' \
    -e 's/^DEFAULT_HOSTNAME=.*/DEFAULT_HOSTNAME="aila"/' \
    -e 's#^HOME_URL=.*#HOME_URL="https://github.com/AilaCompanySolutions-Oficial"#' \
    -e 's#^LOGO=.*#LOGO=aila-gamer#' "$real"
  grep -q '^LOGO=' "$real" || echo 'LOGO=aila-gamer' >> "$real"
done
echo "Aila OS Gamer" > /etc/issue.net

# ---- Brave instalado no primeiro boot (Flatpak); Firefox sai ----
systemctl enable aila-primeiro-boot.service

gtk-update-icon-cache -f /usr/share/icons/hicolor 2>/dev/null || true

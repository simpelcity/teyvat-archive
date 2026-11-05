const escapeHtml = (s: string) =>
  s.replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;')
    .replace(/'/g, '&#39;')

export function formatEffect(text: string): string {
  return escapeHtml(text)
    // {LINK#N11370001}Impact Momentum{/LINK}  →  Impact Momentum
    .replace(/\{LINK#[^}]*\}(.*?)\{\/LINK\}/g, '$1')
    // <color=#RRGGBBAA>…</color>  →  <span style="color:#RRGGBBAA">…</span>
    .replace(
      /&lt;color=(#[0-9A-Fa-f]{6,8})&gt;(.*?)&lt;\/color&gt;/g,
      '<span style="color:$1">$2</span>'
    )
    // literal "\n" (and real newlines) → <br>
    .replace(/\\n|\n/g, '<br>')
}
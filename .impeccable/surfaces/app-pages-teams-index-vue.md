---
version: 1
slug: "app-pages-teams-index-vue"
primary_target: "app/pages/teams/index.vue"
related_targets: ["app/components/TeamIndexCard.vue"]
---

# Teams index (/teams)

Mode: Operate. The owner looks up one of their own teams.

Job: find a team fast and see its composition (characters and elements) at a glance, then open the team page. 9 teams today, each a name plus 4 ordered members; more team fields (description, roles, rotation, notes) are planned but undecided, so rows must have room under the name without assuming their shape.

Constraints: keep the incumbent world (Bootstrap dark theme, HYWenHei display, Nunito UI, element-gradient portraits, gold accents). Rows link to /teams/<slug> (lowercased name, spaces to hyphens). Traveler shows as "<Element> Traveler".

## Direction contract

THESIS: Each team is a party lineup: one full-width row, name on the left, its four members side by side in order like the in-game party setup. Refuses the grid of small cards with a cramped mixed avatar cluster.

OWN-WORLD: #171923 ground, #252a38 rows with a #353b4c full border and 8px radius, gold #d3bc8e for the title and every live state, HYWenHei for team names, Nunito for UI text, portraits on the site's element gradient (element color 55% to 25% into #1c1c28), the four members' element icons (the project's own Genshin element icons, 18px) under each name.

STORY: The owner sees all teams as lineups, recognizes them by faces and element colors, types a team or character name to narrow the list, and opens a team by clicking its row.

FIRST VIEWPORT: Centered gold "Teams" heading; full-width search field with the live team count; stacked rows filling the container width: left, team name at 22px plus element icons; right, four 118px-wide portraits with names beneath. About four and a half rows show at 1440x900. Primary action: the row link.

FORM: Party lineup rows, position 1 of 7 on the ranked list. seed:9412d9209c8778d6. Signature move: on hover or keyboard focus a row's border turns gold and its four portraits step up 4px one after another, left to right, like a party readying; reduced motion keeps only the border change.

FINISH: unreviewed and undocumented is unfinished; this build ends with the finish review, the verdict, DESIGN.md, and every shipping raster carrying its provenance

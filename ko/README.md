# 시작 보관함

이 폴더를 Obsidian에서 보관함으로 엽니다. Markdown을 보여 주는 편집기라면 어느 것이든 괜찮습니다. 그런 다음 이 폴더 안에서 코딩 에이전트를 실행합니다(`claude`, `codex`, 또는 쓰고 있는 다른 도구).

여기 있는 것은 모두 폴더에 든 일반 텍스트 파일입니다. 어떤 노트도 특정 앱이나 에이전트, 모델에 묶여 있지 않아서 그것들이 바뀌어도 보관함은 그대로 쓸 수 있습니다.

- `AGENTS.md`: 에이전트가 지키는 규칙. 한 번 읽어 둡니다. `CLAUDE.md`는 이 파일을 가리킵니다.
- `my-notes/`, `daily/`, `interests/`: 내 노트, 일지, 관심 주제 페이지. 에이전트는 읽을 수 있고 고칠 수 없습니다.
- `skills/`: 에이전트가 순서대로 따르는 절차. 일반 텍스트라서 직접 읽고 고칠 수 있습니다.
- `checks/tool-change-check.md`: 에이전트나 모델이 바뀔 때마다 실행하는 요청 여섯 개.
- `agent/`: 에이전트가 쓰는 모든 것.
- `tasks/`, `inbox/`, `templates/`: 할 일, 아직 정리하지 않은 자료, 노트 템플릿.
- `tools/authorship.py`: 누가 쓴 노트가 몇 개인지 셉니다.

`sample: true`가 적힌 노트는 그래프와 숫자에 보일 것이 있도록 넣어 둔 예시입니다. 학생이 쓴 것이 아니라 이 시작 보관함에 맞춰 만든 것입니다. 시작할 때 지웁니다.

처음 실행할 때:

```bash
git init
git add .
git commit -m "보관함 시작"
python3 tools/authorship.py --write
```

Windows에서 `python3`가 없다고 나오면 `python`으로 실행합니다.

알아 둘 한계: `.claude/settings.json`의 차단은 Claude Code에서만 동작합니다. 다른 에이전트는 `AGENTS.md`만 따르므로 도구 변경 점검을 실행하고 세션이 끝날 때마다 `git diff`를 읽습니다. Claude Code에서도 `my-notes/` 차단은 에이전트의 파일 편집 도구에만 걸립니다. 셸 명령에는 걸리지 않으므로 명령을 승인하기 전에 무엇을 하는 명령인지 읽습니다.

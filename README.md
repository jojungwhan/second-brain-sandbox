# 기록 보관함 연습용 저장소

English: [README.en.md](README.en.md)

CIT의 "기록 보관함과 AI 도우미 12회 과정"에서 쓰는 시작 보관함을 한곳에 모았습니다. 수업 자료를 내려받다가 막히거나 설정이 꼬였을 때 이 저장소 하나만 받아서 처음부터 다시 시작할 수 있습니다.

돈이 드는 것은 Claude나 Codex 구독 하나뿐입니다. API 키는 만들지 않습니다.

- 과정 소개: https://citcoding.com/agent-office/course/
- 회차별 안내: https://citcoding.com/agent-office/course-sessions/
- 선생님 안내: https://citcoding.com/agent-office/course-tutor/

## 들어 있는 것

| 폴더 | 내용 |
| --- | --- |
| `ko/` | 한국어 시작 보관함 |
| `en/` | 영어 시작 보관함. 폴더와 파일 이름은 한국어판과 같습니다 |
| `check.sh`, `check.ps1` | 이 컴퓨터에서 보관함을 쓸 수 있는지 확인하는 스크립트 |

보관함 안에는 에이전트가 지키는 규칙(`AGENTS.md`), 절차 파일 6개(`skills/`), 도구 변경 점검표(`checks/`), 템플릿, 예시 노트가 들어 있습니다.

## 준비물

| 필요한 것 | 왜 | 받는 곳 |
| --- | --- | --- |
| Claude Code 또는 Codex CLI 가운데 하나 | 보관함 안에서 실행하는 코딩 에이전트. 구독 계정으로 로그인합니다 | [Claude Code](https://code.claude.com/docs/en/setup), [Codex CLI](https://developers.openai.com/codex/cli) |
| Git | 에이전트가 무엇을 바꿨는지 확인합니다 | https://git-scm.com/downloads |
| Python 3 (없어도 됨) | 누가 쓴 노트가 몇 개인지 세는 도구에만 씁니다 | https://www.python.org/downloads/ |
| Obsidian (없어도 됨) | 노트를 보기 좋게 엽니다. 다른 편집기도 괜찮습니다 | https://obsidian.md/download |

학생이 직접 가입할 수 없는 서비스는 보호자나 선생님이 관리하는 계정으로 수업 시간에만 씁니다.

## 시작하는 순서

1. 이 페이지 위쪽의 초록색 **Code** 버튼을 누르고 **Download ZIP**을 고릅니다. 받은 파일의 압축을 풉니다.
2. 터미널에서 압축을 푼 폴더로 들어가 확인 스크립트를 실행합니다. 영어판을 쓰려면 `ko` 자리에 `en`을 적습니다.

   macOS, Linux:

   ```bash
   bash check.sh ko
   ```

   Windows(PowerShell):

   ```powershell
   powershell -ExecutionPolicy Bypass -File check.ps1 ko
   ```

3. 모든 줄이 `OK`이면 보관함 폴더로 들어가 에이전트를 실행하고 구독 계정으로 로그인합니다.

   ```bash
   cd ko
   claude
   ```

   Codex를 쓴다면 `claude` 대신 `codex`를 입력합니다.

4. `checks/tool-change-check.md`의 첫 번째 요청을 그대로 넣어 봅니다. 에이전트가 내 노트를 직접 고치지 않고 넣을 문장만 제안하면 규칙이 제대로 동작하는 것입니다.

확인 스크립트는 보관함 폴더가 아직 Git으로 관리되지 않을 때만 `git init`과 첫 커밋을 합니다. 그 밖에는 아무것도 바꾸지 않습니다. 스크립트가 내는 글은 Windows에서 글자가 깨지지 않도록 영어로 적었습니다.

## 내 노트는 내 컴퓨터에만

**Download ZIP으로 받아 주세요.** `git clone`이나 Fork로 받으면 원격 저장소 주소가 함께 따라오고, 그 상태에서 push하면 내 일지와 노트가 인터넷에 올라갈 수 있습니다. 이미 clone했다면 보관함을 쓰기 전에 원격 주소를 지웁니다.

```bash
git remote remove origin
```

에이전트 규칙에도 보관함 내용을 밖으로 보내지 않는다는 항목이 있습니다. 그래도 내 컴퓨터의 설정은 직접 확인합니다.

## 잘 안 될 때

| 증상 | 해 볼 것 |
| --- | --- |
| `claude` 또는 `codex` 명령을 찾을 수 없다고 나옵니다 | 위 표의 설치 안내대로 설치한 뒤 터미널을 새로 엽니다 |
| Windows에서 `python3`가 없다고 나옵니다 | `python tools\authorship.py`로 실행합니다 |
| Claude Code가 이 폴더를 신뢰하는지 묻습니다 | 보관함 폴더가 맞는지 확인하고 수락합니다. 처음 한 번만 묻습니다 |
| Codex를 스크립트에서 실행했는데 멈춰 있습니다 | 입력을 기다리는 것입니다. 터미널에서 직접 `codex`를 실행합니다 |
| 예전에 받은 보관함에서 `git add`를 할 때 줄바꿈 경고가 여러 줄 나옵니다 | 해가 없는 경고입니다. 이 저장소의 보관함에서는 나오지 않습니다 |
| 메모장으로 쓴 노트가 작성자 없는 노트로 세어집니다 | 이 저장소의 보관함에서는 고쳐졌습니다. 예전 보관함이라면 `tools/authorship.py`만 새것으로 바꿉니다 |
| 사용 한도에 닿았다고 나옵니다 | 구독 요금제의 한도입니다. 한도가 풀릴 때까지 기다립니다. API 키를 만들지 않습니다 |
| 에이전트가 규칙을 지키지 않습니다 | `checks/tool-change-check.md`의 요청 여섯 개를 실행해 어느 줄에서 실패하는지 확인하고 선생님에게 알립니다 |

보관함을 처음 상태로 되돌리고 싶으면 이 저장소를 다시 받으면 됩니다. 내가 쓴 노트는 `my-notes/`, `daily/`, `interests/` 폴더를 먼저 다른 곳에 복사해 둡니다.

## 확인한 환경

| 환경 | 확인한 것 |
| --- | --- |
| Linux | 한국어판과 영어판 보관함, Claude Code와 Codex CLI |
| Windows 11 (한국어) | 영어판 보관함의 점검 요청 다섯 개, 한국어판 보관함의 첫 번째 요청, 이 저장소의 `check.ps1`. Claude Code와 Codex CLI |
| macOS | 아직 확인하지 못했습니다 |

확인한 날짜와 버전은 [선생님 안내](https://citcoding.com/agent-office/course-tutor/)에 있습니다. 도구나 모델이 바뀌면 점검표를 다시 실행합니다.

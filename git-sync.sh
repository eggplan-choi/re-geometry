#!/usr/bin/env bash

# 오류 발생 시 즉각 중단
set -e

# 1. Git 저장소 여부 확인
if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    echo "[오류] 현재 디렉터리는 Git 저장소가 아닙니다."
    exit 1
fi

# 2. 현재 체크아웃된 브랜치 이름 확인
CURRENT_BRANCH=$(git symbolic-ref --short HEAD 2>/dev/null || echo "")

if [ -z "$CURRENT_BRANCH" ]; then
    echo "[오류] 분리된 HEAD(detached HEAD) 상태에서는 실행할 수 없습니다."
    exit 1
fi

echo "=========================================="
echo " 작업 브랜치: $CURRENT_BRANCH"
echo "=========================================="

# 3. 원격 저장소 변경 사항 가져오기 (Pull)
echo ">> [1/4] git pull origin $CURRENT_BRANCH 실행 중..."
git pull origin "$CURRENT_BRANCH"

# 4. 작업 트리 변경 사항 확인
if [ -z "$(git status --porcelain)" ]; then
    echo ">> 변경되거나 새로 추가된 파일이 없습니다. 작업을 종료합니다."
    exit 0
fi

# 5. 커밋 메시지 결정 (인자가 없을 때 한글/문자 상태 출력 후 입력 대기)
COMMIT_MSG="$1"
if [ -z "$COMMIT_MSG" ]; then
    echo ""
    echo "---------------- [변경 사항 목록] ----------------"
    # -c core.quotepath=false 옵션을 주어 한글/유니코드 파일명이 숫자로 깨지지 않게 출력
    git -c core.quotepath=false status -s
    echo "---------------------------------------------------"
    echo ""

    read -rp ">> 커밋 메시지를 입력하세요 (미입력 시 기본 타임스탬프 적용): " INPUT_MSG
    if [ -z "$INPUT_MSG" ]; then
        COMMIT_MSG="자동 동기화: $(date '+%Y-%m-%d %H:%M:%S')"
    else
        COMMIT_MSG="$INPUT_MSG"
    fi
fi

# 6. 변경 사항 스테이징 (Add)
echo ">> [2/4] git add -A 실행 중..."
git add -A

# 7. 커밋 생성 (Commit)
echo ">> [3/4] git commit 실행 중... (메시지: \"$COMMIT_MSG\")"
git commit -m "$COMMIT_MSG"

# 8. 원격 저장소로 푸시 (Push)
echo ">> [4/4] git push origin $CURRENT_BRANCH 실행 중..."
git push origin "$CURRENT_BRANCH"

echo "=========================================="
echo " 동기화가 성공적으로 완료되었습니다."
echo "=========================================="

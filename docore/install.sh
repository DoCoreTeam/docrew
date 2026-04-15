#!/bin/bash
set -euo pipefail

GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN}  🏢 DOCORE ADK Installer v1.0.0${NC}"
echo -e "${GREEN}  16 AI Agents Orchestration for Claude Code${NC}"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""

CLAUDE_DIR="${HOME}/.claude"
SKILLS_DIR="${CLAUDE_DIR}/skills"
DOCORE_DIR="${SKILLS_DIR}/docore"
GSTACK_DIR="${SKILLS_DIR}/gstack"

DOCORE_REPO="https://github.com/DoCoreTeam/docore.git"
GSTACK_REPO="https://github.com/garrytan/gstack.git"

# ── 1. DOCORE ──────────────────────────────────
echo -e "${BLUE}[1/3] Installing DOCORE...${NC}"
mkdir -p "${SKILLS_DIR}"

if [ -d "$DOCORE_DIR" ]; then
    echo -e "${YELLOW}  ⟳ Already installed. Updating...${NC}"
    git -C "$DOCORE_DIR" pull origin main --quiet
else
    # Clone full repo, then move the inner docore/ dir to skills
    TMP_DIR=$(mktemp -d)
    git clone --depth 1 "$DOCORE_REPO" "$TMP_DIR" --quiet
    cp -r "$TMP_DIR/docore" "$DOCORE_DIR"
    rm -rf "$TMP_DIR"
fi
echo -e "${GREEN}  ✅ DOCORE installed at $DOCORE_DIR${NC}"

# ── 2. GSTACK ──────────────────────────────────
echo ""
echo -e "${BLUE}[2/3] Installing gstack (Garry Tan's Claude Code setup)...${NC}"

if [ -d "$GSTACK_DIR" ]; then
    echo -e "${YELLOW}  ⟳ Already installed. Updating...${NC}"
    git -C "$GSTACK_DIR" pull origin main --quiet
else
    git clone --depth 1 "$GSTACK_REPO" "$GSTACK_DIR" --quiet
fi
echo -e "${GREEN}  ✅ gstack installed at $GSTACK_DIR${NC}"

# ── 3. Registries ──────────────────────────────
echo ""
echo -e "${BLUE}[3/3] Setting up registries...${NC}"
mkdir -p "${CLAUDE_DIR}/reports"

for file in error-registry skill-registry project-registry decision-log; do
    if [ ! -f "${CLAUDE_DIR}/${file}.md" ]; then
        cp "${DOCORE_DIR}/templates/${file}.md" "${CLAUDE_DIR}/${file}.md"
        echo -e "${GREEN}  ✅ ${file}.md created${NC}"
    else
        echo -e "${YELLOW}  ⏭️  ${file}.md already exists, skipping${NC}"
    fi
done

# ── Done ───────────────────────────────────────
echo ""
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN}  ✅ Installation complete!${NC}"
echo ""
echo -e "  📁 DOCORE:  ${DOCORE_DIR}"
echo -e "  📁 gstack:  ${GSTACK_DIR}"
echo -e "  🤖 Agents:  16 (PLANNER + GENERATOR + EVALUATOR + SUPPORT)"
echo ""
echo -e "  ${YELLOW}Note:${NC} ECC (Everything Claude Code) skills are referenced by"
echo -e "  agents at runtime. Install from: https://github.com/anthropics/ecc"
echo ""
echo -e "  🚀 ${YELLOW}Getting started:${NC}"
echo -e "     1. Open Claude Code in your project"
echo -e "     2. ${YELLOW}/ceo-init${NC}               Initialize project"
echo -e "     3. ${YELLOW}/ceo \"build a todo app\"${NC}   Start development"
echo ""
echo -e "  📋 All commands:"
echo -e "     ${YELLOW}/ceo \"task\"${NC}      Full pipeline (all 16 agents)"
echo -e "     ${YELLOW}/ceo-init${NC}        Project setup + harness"
echo -e "     ${YELLOW}/ceo-status${NC}      Show current status"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"

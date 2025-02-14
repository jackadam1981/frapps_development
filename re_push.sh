#!/bin/bash

# 添加所有修改到暂存区
git add -A

# 修改上次提交（保持原提交信息）
git commit --amend --no-edit

# 强制推送到远程仓库（使用更安全的force-with-lease）
git push --force-with-lease
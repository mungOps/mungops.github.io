#!/bin/bash

# 추가할 RSS Feed 블록
read -r -d '' RSS_BLOCK <<'EOF'
<div style="text-align: center; margin-top: 1em;">
{{< hextra/hero-badge link="index.xml" >}}
  <span>RSS Feed</span>
  {{< icon name="rss" attributes="height=14" >}}
{{< /hextra/hero-badge >}}
</div>
EOF

# 현재 디렉토리 기준 모든 .md 파일 순회
find . -type f -name "*.md" | while read -r file; do
  if grep -Fq "{{< hextra/hero-badge link=\"index.xml\" >}}" "$file"; then
    echo "⏭️  이미 있음: $file"
  else
    echo -e "\n\n$RSS_BLOCK" >> "$file"
    echo "✅ 추가 완료: $file"
  fi
done


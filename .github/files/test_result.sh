cat ./result.txt | tail -2 | sed 's/^.*2022-/2022-/' > ./check.txt
diff -u ./.github/files/Explore-logs.txt ./check.txt

@echo off
echo Converting amp
for %%a in (*.dtd) do ssr 0 "&amp;" "&" %%a
echo converting lt and gt
for %%a in (*.dtd) do ssr 0 "&lt;" "<" %%a
for %%a in (*.dtd) do ssr 0 "&gt;" ">" %%a
echo Back-converting " & "
for %%a in (*.dtd) do ssr 0 " & " " &amp; " %%a
echo Done!
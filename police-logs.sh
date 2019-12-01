export DATE=$(date +"%a %b %d %H:00:00 %Y -0400")
export GIT_AUTHOR_DATE=$DATE
export GIT_COMMITTER_DATE=$DATE

cd /tmp
git clone https://user:token@github.com/mit/police-logs
cd police-logs

git config user.name "user"
git config user.email user@mit.edu

wget -e robots=off --quiet --backups --timestamping --inet4-only --no-directories --directory-prefix=presslogs --recursive --level=inf --accept "*.pdf" --domains=police.mit.edu --ignore-case --include /sites/default/files/MIT-Police-Files https://police.mit.edu/police-logs

git add presslogs/*
git commit --message "$DATE"

git push https://user:token@github.com/mit/police-logs master
cd ..
rm -rf police-logs

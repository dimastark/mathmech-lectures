cd ..
git clone https://github.com/dimastark/mathmech-lectures.git --branch pdf --single-branch pdf_build
cd pdf_build

rm -rf *
rm .travis.yml
rm .gitignore

mv ../mathmech-lectures/_build/*.pdf .

git config --global user.email "travis@travis-ci.org"
git config --global user.name "Travis CI"
git remote add origin-pdf https://${GH_TOKEN}@github.com/dimastark/mathmech-lectures > /dev/null 2>&1
git add .
git commit --message "Собранные pdf'ки №$TRAVIS_BUILD_NUMBER [ci skip]"
git push origin-pdf HEAD:pdf -f

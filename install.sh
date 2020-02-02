#!/usr/make

# prepare source
xctemplates_zip=FireDemoXCProjectTemplate.zip
filetemplates_zip=XQCustomXCFileTemplate.zip

local_xctemplates_zip=`pwd`/$xctemplates_zip
local_filetemplates_zip=`pwd`/$filetemplates_zip

remote_url="https://raw.githubusercontent.com/xq-120/FireDemoAppTemplate/master/archive"
temp_directory=`mktemp -d`


if [ ! -f "$local_xctemplates_zip" ]; then
    # fetch remote xctemplates zip
    remote_xctemplates_zip=$remote_url/$xctemplates_zip
    local_xctemplates_zip=$temp_directory/$xctemplates_zip
    curl $remote_xctemplates_zip -o $local_xctemplates_zip -s
    echo "fetch $remote_xctemplates_zip to $local_xctemplates_zip"
fi

if [ ! -f "$local_filetemplates_zip" ]; then
    # fetch remote filetemplates zip
    remote_filetemplates_zip=$remote_url/$filetemplates_zip
    local_filetemplates_zip=$temp_directory/$filetemplates_zip
    curl $remote_filetemplates_zip -o $local_filetemplates_zip -s
    echo "fetch $remote_filetemplates_zip to $local_filetemplates_zip"
fi

templates=~/Library/Developer/Xcode/Templates

target_projecttemplates="$templates"/Project\ Templates/Application
target_filetemplates="$templates"/File\ Templates/

# handle unexpected issue
if [ -f "$templates" ] ;
then
    rm "$templates"
fi;
if [ -h "$target_projecttemplates" ] ;
then
    rm "$target_projecttemplates"
fi;
rm -fr "$target_projecttemplates"/Fire Demo App.xctemplate
rm -f "$target_filetemplates"/XQCustom.*

install() {
    source_zip="$1"
    target="$2"
    mkdir -p "$target"
    unzip -o -q "$source_zip" -d "$target"
}

# install project templates
install "$local_xctemplates_zip" "$target_projecttemplates"
echo "Project templates is installed at $target_projecttemplates"

# install file templates
install "$local_filetemplates_zip" "$target_filetemplates"
echo "File templates is installed at $target_filetemplates"
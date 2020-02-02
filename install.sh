#!/usr/make

# prepare source
xctemplates_zip=FireDemoXCProjectTemplate.zip

local_xctemplates_zip=`pwd`/$xctemplates_zip

remote_url="https://raw.githubusercontent.com/xq-120/FireDemoAppTemplate/master/archive"
temp_directory=`mktemp -d`


if [ ! -f "$local_xctemplates_zip" ]; then
    # fetch remote xctemplates zip
    remote_xctemplates_zip=$remote_url/$xctemplates_zip
    local_xctemplates_zip=$temp_directory/$xctemplates_zip
    curl $remote_xctemplates_zip -o $local_xctemplates_zip -s
    echo "fetch $remote_xctemplates_zip to $local_xctemplates_zip"
fi

templates=~/Library/Developer/Xcode/Templates

target_templates="$templates"/Project\ Templates/Application

# handle unexpected issue
if [ -f "$templates" ] ;
then
    rm "$templates"
fi;
if [ -h "$target_templates" ] ;
then
    rm "$target_templates"
fi;
rm -fr "$target_templates"/Fire Demo App.xctemplate

install() {
    source_zip="$1"
    target="$2"
    mkdir -p "$target"
    unzip -o -q "$source_zip" -d "$target"
}

# install code templates
install "$local_xctemplates_zip" "$target_templates"
echo "Code templates is installed at $target_templates"
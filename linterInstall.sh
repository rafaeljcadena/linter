#!/bin/sh
export ROOT_PATH=$(pwd)
export LINT_PATH="$(echo $ROOT_PATH)/linter"

echo 'Installing Linter'

if ! ls | grep ^linter$; then
	git clone git@github.com:rafaeljcadena/linter.git
fi

cd $LINT_PATH && \
npm i -D && \

cd $ROOT_PATH

echo 'Copying dev dependencies to node_modules'
if ! ls $ROOT_PATH | grep ^node_modules$; then
	mkdir $ROOT_PATH/node_modules
fi

cp -R $LINT_PATH/node_modules/* $ROOT_PATH/node_modules && \

echo 'Copying .eslintrc' && \
if ! ls $ROOT_PATH | grep ^eslintrc$; then
	cp $LINT_PATH/.eslintrc $ROOT_PATH
else
	echo 'Already exists .eslintrc'
fi

echo 'Copying .eslintrc' && \
if ! ls $ROOT_PATH | grep ^eslintrc$; then
	cp $LINT_PATH/.eslintrc $ROOT_PATH
else
	echo 'Already exists .eslintrc'
fi

echo 'Copying .prettierrc' && \
if ! ls $ROOT_PATH | grep ^prettierrc$; then
	cp $LINT_PATH/.prettierrc $ROOT_PATH
else
	echo 'Already exists .prettierrc'
fi

echo 'Cleaning...'
# cd .. && rm -rf linter
rm -rf $ROOT_PATH/linter

echo 'Done!'

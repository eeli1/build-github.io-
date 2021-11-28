case "${GITHUB_EVENT_NAME}" in
    push)
        echo "setup github" 
        
        echo "cloneing $USERNAME.github.io ad removing all exept .md files"
        git clone https://github.com/eeli1/$USERNAME.github.io
        cd eeli1.github.io
        rm !(*.md)
        cd ..
        
        echo "building website"
        rustup target add wasm32-unknown-unknown
        trunk build
        
        echo "copy website to repo"
        cp dist/* $USERNAME.github.io
        cd eeli1.github.io
        
        echo "push new content"
        git add .
        git commit -m "$MSG"
        git push https://${USERNAME}:${TOKEN}@https://github.com/eeli1/$USERNAME.github.io
    ;;
    *)
        break
    ;;
esac
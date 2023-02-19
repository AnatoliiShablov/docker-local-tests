FROM opensuse/tumbleweed

RUN ["zypper", "in", "-y", "gtest", "clang", "clang-tools", "cmake", "make", "vim", "bash", "git", "find", "grep", "gcc-c++"]

RUN echo 'user:x:100:100:user:/home/user:/bin/bash' > /etc/passwd && \
    echo 'user:*:1::::::' > /etc/shadow                           && \
    mkdir -p /home/user

COPY entrypoint.sh /home/user/entrypoint.sh

RUN chmod +x /home/user/entrypoint.sh && chown -R 100:100 /home/user 

USER user

WORKDIR /home/user

ENTRYPOINT ["/home/user/entrypoint.sh"]

cask "binlogviz" do
  version "0.23.26"

  on_macos do
    on_intel do
      sha256 "32d99c3881ff8b758e26662ad0baa26826d092592c79a9d9d8412f1b9104acb4"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.26/binlogviz_0.23.26_darwin_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      sha256 "a8a27a0e6f1ae6ad79240fc29bacb1b93dbdbc8864a52eb32fa2cfcf8b6b64c2"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.26/binlogviz_0.23.26_darwin_arm64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
  end

  on_linux do
    on_intel do
      sha256 "23fdd82bda1fe3bed99784d3531535cef7f369ec60614d63b9f0a8170efbd93e"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.26/binlogviz_0.23.26_linux_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        sha256 "6493d1432cc983ba0e132966f800009c216b41c43004be2585f3bac2d3002522"
        url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.26/binlogviz_0.23.26_linux_arm64.tar.gz",
            verified: "github.com/Fanduzi/BinlogVisualizer/"
      end
    end
  end

  name "BinlogViz"
  desc "Local CLI for MySQL ROW binlog analysis"
  homepage "https://github.com/Fanduzi/BinlogVisualizer"

  binary "binlogviz"

  postflight do
    if OS.mac?
      system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", staged_path/"binlogviz"]
    end
  end
end

cask "binlogviz" do
  version "0.23.10"

  on_macos do
    on_intel do
      sha256 "d91988840d7ad48b61e30732a882e2365939cd3aa9327ca8cb319796003ff9e4"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.10/binlogviz_0.23.10_darwin_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      sha256 "748eb1ee8bb3109a851f85a52f4bdf8e447bcf7287db63ea6f84ec8475fa0327"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.10/binlogviz_0.23.10_darwin_arm64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
  end

  on_linux do
    on_intel do
      sha256 "9c1013e41c684d0db0a491ab00daf7bc57cb79dfbc86a599f07b03e692c22c0a"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.10/binlogviz_0.23.10_linux_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        sha256 "ebe9023084b2dc488a717f600b911444cc33fafbe67ac0431a24260bf04f5469"
        url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.10/binlogviz_0.23.10_linux_arm64.tar.gz",
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

cask "binlogviz" do
  version "0.23.16"

  on_macos do
    on_intel do
      sha256 "5941bbcb6d4b997f22d62e946c445f9abe87592159c07b3781164009223f9b04"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.16/binlogviz_0.23.16_darwin_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      sha256 "c4258b10bb1b7fb019e1a3cff51e6c8c08467bc7b30b55db6622e744f630ce8e"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.16/binlogviz_0.23.16_darwin_arm64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
  end

  on_linux do
    on_intel do
      sha256 "f7b97a4ec6ca4da5a41d741579b9b1034567b5f91cf163a1aa1df5c8898ffed5"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.16/binlogviz_0.23.16_linux_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        sha256 "c394a703b956079789ee5e86228bd8d0251062c751f38d3a891b519fbd12c7f0"
        url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.16/binlogviz_0.23.16_linux_arm64.tar.gz",
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

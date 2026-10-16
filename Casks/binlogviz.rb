cask "binlogviz" do
  version "0.26.0"

  on_macos do
    on_intel do
      sha256 "bce778e15ecad8b1d07bc489a38cb36d453d5b69c08fab45b713866e2d87eb93"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.26.0/binlogviz_0.26.0_darwin_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      sha256 "f3ac66d95bdb955a05f125b5903971f5f78a7a8d1ad8bb0d62e46ea59cee4ee4"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.26.0/binlogviz_0.26.0_darwin_arm64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
  end

  on_linux do
    on_intel do
      sha256 "7b1b5e61e5a71324feef1cf19057908e5c22917f2fbcc7fb2d8e59c1845d95b3"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.26.0/binlogviz_0.26.0_linux_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        sha256 "b6c41798783903b59fb6be21a6c04672c1a1daa2b63fb9beee58491dc04da6f7"
        url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.26.0/binlogviz_0.26.0_linux_arm64.tar.gz",
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

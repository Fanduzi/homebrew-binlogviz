cask "binlogviz" do
  version "0.19.0"

  on_macos do
    on_intel do
      sha256 "047245b82479ba746149a420d624673197fc0d29505d3545ef120f74bcaf786c"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.19.0/binlogviz_0.19.0_darwin_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      sha256 "e96b89b6b019a692cecd70cd4a02f6b32d729b60115c49f9796cf65adb1783e5"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.19.0/binlogviz_0.19.0_darwin_arm64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
  end

  on_linux do
    on_intel do
      sha256 "51059e757e112eaa9f64300c5a661b8e7014ae81722fc2228bb3c78e36d49072"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.19.0/binlogviz_0.19.0_linux_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        sha256 "9ad5b348444af372a75983b2ad7f89579ad784f53e338a7dacedd10a2b28a62d"
        url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.19.0/binlogviz_0.19.0_linux_arm64.tar.gz",
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

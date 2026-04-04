cask "binlogviz" do
  version "0.9.1"

  on_macos do
    on_intel do
      sha256 "630d57bca80e6b86dba040fcf225bf634fcf98150a9f2643a4f2f2a4b5b36d51"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.9.1/binlogviz_0.9.1_darwin_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      sha256 "1cfd6614246d78639c26654a6b9178088c1a6d665402dbb60e617131c4d5d9db"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.9.1/binlogviz_0.9.1_darwin_arm64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
  end

  on_linux do
    on_intel do
      sha256 "6288cfab6f09a9d924e55e3fbd0b7b24329981efcef4895a5e4d00c029c49a7b"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.9.1/binlogviz_0.9.1_linux_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        sha256 "a696c67d88efa70d0ae7c9bc0c50f231a33bbefae302fd734a8febffb111a3a6"
        url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.9.1/binlogviz_0.9.1_linux_arm64.tar.gz",
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

cask "binlogviz" do
  version "0.23.0"

  on_macos do
    on_intel do
      sha256 "b822c180c71e95b2161190a4943d8c92573601a5d6b51dd79d6ea646b0d203fd"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.0/binlogviz_0.23.0_darwin_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      sha256 "bb689310cf7d486fb3c23d9f4c9cb368c9e0c8b12d7ac4d040b85acadbf5d3c9"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.0/binlogviz_0.23.0_darwin_arm64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
  end

  on_linux do
    on_intel do
      sha256 "7319c163c82ef66fa37b35d8d96173f4c28d06ee0b587a6d2dd18e90b375835e"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.0/binlogviz_0.23.0_linux_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        sha256 "40ca7f3306314cfd264f151f878cd427ba7699ea65f3cf4c79f6b320bbcdeb6c"
        url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.0/binlogviz_0.23.0_linux_arm64.tar.gz",
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

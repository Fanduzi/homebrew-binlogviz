cask "binlogviz" do
  version "0.8.0"

  on_macos do
    on_intel do
      sha256 "8edbe356eef0f5fb5b780668699a9efd833712d4467902db5c2cf2744344d2c8"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.8.0/binlogviz_0.8.0_darwin_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      sha256 "fc00cce03c2687448449b4ad1a8b386323db7101bc40399c4fc043b5ce8d3a1b"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.8.0/binlogviz_0.8.0_darwin_arm64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
  end

  on_linux do
    on_intel do
      sha256 "f146270c70a5e30a1add0ad3c64c153f0eebbd825146cc8a90860679cc25d401"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.8.0/binlogviz_0.8.0_linux_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        sha256 "80f4086f152e68f36059e99f264fe0d8af2ed2e2932ccc14771150c4b205570c"
        url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.8.0/binlogviz_0.8.0_linux_arm64.tar.gz",
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

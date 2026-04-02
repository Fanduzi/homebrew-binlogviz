cask "binlogviz" do
  version "0.8.3"

  on_macos do
    on_intel do
      sha256 "ae3d6bb93daad18a9f01b40d2b5a918da4684f6f1c2fdb10e9b9a72669bd0dee"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.8.3/binlogviz_0.8.3_darwin_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      sha256 "08d8d18e85752d68d938c898d1c9bf586fe71f41bdd8a3f0f19cf43607ea0c80"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.8.3/binlogviz_0.8.3_darwin_arm64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
  end

  on_linux do
    on_intel do
      sha256 "8bd781aa2099a960b8d39f95ff40c12963d9cf6d0999e990d1e954ac0b801377"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.8.3/binlogviz_0.8.3_linux_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        sha256 "d94c592535e63eeccfb21119c9b5244d62d6cda8eabdbc81a23280df7ce1e9d5"
        url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.8.3/binlogviz_0.8.3_linux_arm64.tar.gz",
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
